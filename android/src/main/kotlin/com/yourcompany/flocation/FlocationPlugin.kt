package com.yourcompany.flocation

import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.PluginRegistry.Registrar

import android.app.Activity
import android.os.Bundle
import android.os.AsyncTask
import java.lang.Thread
import android.content.Context
import android.location.Location;
import android.location.LocationManager;
import android.location.LocationListener

class FlocationPlugin(val activity: Activity) : StreamHandler, LocationListener {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar): Unit {
            val LocationID = "motionmobs.com/flocation"
            val channel = EventChannel(registrar.messenger(), LocationID)
            channel.setStreamHandler(FlocationPlugin(registrar.activity()))
        }
    }

    //Flutter Layer Communication
    var events: EventSink? = null
    var locationManager: LocationManager? = null

    override fun onListen(arguments: Any?, eventSink: EventSink?) {
        events = eventSink
        if (locationManager == null) {
            locationManager = activity.getSystemService(Context.LOCATION_SERVICE) as LocationManager
        }
        locationManager?.requestLocationUpdates(LocationManager.GPS_PROVIDER, 0,  0.0f, this)
    }

    override fun onCancel(arguments: Any?) {
        locationManager?.removeUpdates(this)
    }

    //Listen for location changes and send them to eventSink

    override fun onLocationChanged(location: Location?){
        if (events != null && location != null){
            events?.success(listOf(location?.getLatitude(),location?.getLongitude(), location?.getAltitude(), location?.getAccuracy()))
        }
    }

    override fun onStatusChanged(provider: String, status:Int, extras: Bundle?){

    }

    override fun onProviderEnabled(provider: String){

    }

    override fun onProviderDisabled(provider: String){

    }
}

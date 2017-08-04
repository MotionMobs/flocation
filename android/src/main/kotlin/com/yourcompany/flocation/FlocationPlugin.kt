package com.yourcompany.flocation

import android.os.AsyncTask
import java.lang.Thread
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlocationPlugin(): StreamHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar): Unit {
        val LocationID = "motionmobs.com/flocation"
        val channel = EventChannel(registrar.messenger(), LocationID)
      channel.setStreamHandler(FlocationPlugin())
    }
  }



   override fun onListen(arguments: Any?, eventSink: EventSink?){
        //TODO: stream location events!

       TestEvents().execute(eventSink);
    }

   override fun onCancel(arguments: Any?){
        //TODO: clean up!
    }

    inner class TestEvents: AsyncTask<EventSink?, Boolean, Boolean>() {

        override fun onPreExecute() {
            super.onPreExecute()
        }

        override fun doInBackground(vararg events: EventSink?):Boolean {
            for (eventSink in events) {
                if(eventSink != null) {
                    for (i in 0..99) {
                        val lat = i.toDouble();
                        val long = i.toDouble();
                        val elev = i.toDouble();
                        eventSink?.success(listOf(lat, long, elev))
                        Thread.sleep(1_000)
                    }
                    return true
                }
            }
            return false
        }

        override fun onPostExecute(result: Boolean) {
            super.onPostExecute(result)
        }
    }
}

package com.example.flutter_unit

import android.app.Application
import com.baidu.mobstat.StatService

class TinApplication : Application() {

    override fun onCreate() {
        super.onCreate()
        StatService.start(this)
    }

}
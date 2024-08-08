# flutter_flavor_app

A new Flutter project.

[flutter_flavor](https://docs.flutter.dev/deployment/flavors)

Androidの`flavor`設定。
`android/app/build.gradle`のファイルに設定を追加する。

```
flavorDimensions "environment"
    productFlavors {
        prod {
            dimension "environment"
            applicationIdSuffix ""
            resValue "string", "app_name", "Flutter Flavor App"
        }
        stg {
            dimension "environment"
            applicationIdSuffix ".stg"
            resValue "string", "app_name", "Flutter Flavor App (Staging)"
        }
        dev {
            dimension "environment"
            applicationIdSuffix ".dev"
            resValue "string", "app_name", "Flutter Flavor App (Dev)"
        }
    }
```

修正後のファイル
```
plugins {
    id "com.android.application"
    id "kotlin-android"
    id "dev.flutter.flutter-gradle-plugin"
}

def localProperties = new Properties()
def localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.withReader("UTF-8") { reader ->
        localProperties.load(reader)
    }
}

def flutterVersionCode = localProperties.getProperty("flutter.versionCode")
if (flutterVersionCode == null) {
    flutterVersionCode = "1"
}

def flutterVersionName = localProperties.getProperty("flutter.versionName")
if (flutterVersionName == null) {
    flutterVersionName = "1.0"
}

android {
    namespace = "com.jboycode.flutter_flavor_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    defaultConfig {
        applicationId = "com.jboycode.flutter_flavor_app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutterVersionCode.toInteger()
        versionName = flutterVersionName
    }

    flavorDimensions "environment"
    productFlavors {
        prod {
            dimension "environment"
            applicationIdSuffix ""
            resValue "string", "app_name", "Flutter Flavor App"
        }
        stg {
            dimension "environment"
            applicationIdSuffix ".stg"
            resValue "string", "app_name", "Flutter Flavor App (Staging)"
        }
        dev {
            dimension "environment"
            applicationIdSuffix ".dev"
            resValue "string", "app_name", "Flutter Flavor App (Dev)"
        }
    }

    buildTypes {
        release {
            signingConfig signingConfigs.debug
        }
    }
}

flutter {
    source = "../.."
}
```

実行するときのコマンド

prod:
```shell
flutter run --flavor prod
```

stg:
```shell
flutter run --flavor stg
```

dev
```shell
flutter run --flavor dev
```
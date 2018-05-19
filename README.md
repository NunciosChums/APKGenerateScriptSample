# APK Generate Script Sample

keystore 에 관한 정보는 https://developer.android.com/studio/publish/app-signing?hl=ko 에 있다.

## copy .keystore to app root folder
keystore 파일을 `TestApp/TestApp.keystore`에 넣어줬다.
만약 사용하고 싶은 keystore 파일이 있다면 그대로 넣어주면 된다.

## keystore.properties
[TestApp/keystore.properties](TestApp/keystore.properties) 파일에 keystore 정보를 넣어준다.

## app/build.gradle
[buil.gradle](TestApp/app/build.gradle)에 빌드할 때 keystore 정보를 이용하게 설정해준다.

```
def keystorePropertiesFile = rootProject.file("keystore.properties")
def keystoreProperties = new Properties()
keystoreProperties.load(new FileInputStream(keystorePropertiesFile))

android {
  signingConfigs {
      TestAppSigning {
          keyAlias keystoreProperties['keyAlias']
          keyPassword keystoreProperties['keyPassword']
          storeFile file(keystoreProperties['storeFile'])
          storePassword keystoreProperties['storePassword']
      }
  }
  .
  .
  .
  buildTypes {
      debug{
          signingConfig signingConfigs.TestAppSigning
          .
          .
          .

      }
      release {
          signingConfig signingConfigs.TestAppSigning
          .
          .
          .
      }
  }
}
```

## script for macOS
[script/make_apk.sh](script/make_apk.sh) 파일을 실행하면, 파일명에 버전을 붙인 `TestApp_v1.0.apk` 파일을 만들고, 바탕화면으로 이동시킨다.

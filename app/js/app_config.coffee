# ==> Initialize angular's app.
app = angular.module('ionicstarter', [
  'ionic'
  'ng-token-auth'
  'ngDropzone'
  'dropstore-ng'
])
.constant('_', window._)
.config ($authProvider) ->
    $authProvider.configure
      apiUrl: GLOBALS.API_URL
      storage: 'localStorage'
      tokenFormat:
        "access-token": "{{ token }}"
        "token-type":   "Bearer"
        client:         "{{ clientId }}"
        expiry:         "{{ expiry }}"
        uid:            "{{ uid }}"


for k, v of GLOBALS
  app.constant k, v

# To debug, go to http://localhost:31173/client/#anonymous
if GLOBALS.WEINRE_ADDRESS && (ionic.Platform.isAndroid() || ionic.Platform.isIOS())
  addElement document, "script", id: "weinre-js", src: "http://#{GLOBALS.WEINRE_ADDRESS}/target/target-script-min.js#anonymous"

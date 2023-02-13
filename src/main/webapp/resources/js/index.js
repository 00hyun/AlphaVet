window.addEventListener('DOMContentLoaded', function(event) {
  websdkready();
});

function websdkready() {
  var testTool = window.testTool;
  if (testTool.isMobileDevice()) {
   // vConsole = new VConsole();
  }

  var SDK_KEY = "k8uaXewLHNyij18lEqAh3wMuAFJ2gi2EXWw1";
  var SDK_SECRET = "g0xTWKAOC9fdeGAoPSIVamXtW8wUZiOlTugm";

  document
    .getElementById("meeting_number")
    .addEventListener("input", function (e) {
      var tmpMn = e.target.value.replace(/([^0-9])+/i, "");
      if (tmpMn.match(/([0-9]{9,11})/)) {
        tmpMn = tmpMn.match(/([0-9]{9,11})/)[1];
      }
      var tmpPwd = e.target.value.match(/pwd=([\d,\w]+)/);
      if (tmpPwd) {
        document.getElementById("meeting_pwd").value = tmpPwd[1];
      }
      document.getElementById("meeting_number").value = tmpMn;
    });

  document.getElementById("clear_all").addEventListener("click", function (e) {
    window.location.href = "/zoom";
  });
  
  
  
  
  

  // click join meeting button
  document
    .getElementById("join_meeting")
    .addEventListener("click", function (e) {
      e.preventDefault();
      var meetingConfig = testTool.getMeetingConfig();
      if (!meetingConfig.mn || !meetingConfig.name) {
        alert("Meeting number or username is empty");
        return false;
      }

      
      testTool.setCookie("meeting_number", meetingConfig.mn);
      testTool.setCookie("meeting_pwd", meetingConfig.pwd);

      var signature = ZoomMtg.generateSDKSignature({
        meetingNumber: meetingConfig.mn,
        sdkKey: SDK_KEY,
        sdkSecret: SDK_SECRET,
        role: meetingConfig.role,
        success: function (res) {
          console.log(res.result);
          meetingConfig.signature = res.result;
          meetingConfig.sdkKey = SDK_KEY;
          var joinUrl = "/zoom2?" + testTool.serialize(meetingConfig);
          console.log(joinUrl);
          window.open(joinUrl, "_self");
        },
      });
    });
}

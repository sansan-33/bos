<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!-- Example blocking message overlay -->
        <div id="abd-overlay" class="abd-overlay" style="display:none;">
            <div class="abd-container">
                <div class="abd-login-text"><spring:message code='label.adblocker'/></div>
            </div>
        </div>
        <!-- //Example blocking message overlay -->

        <script language="JavaScript" type="text/javascript">
            //########## ABDeveloper Configurations ##########//
            //Create ABDeveloper object
            var abd = new ABDeveloper();

            //Setting ABDeveloper options
            abd.setOptions({
                debug: false,            //show debug message (remove this option in production mode)
                warning: false,          //show warning message (remove this option in production mode)
                error: false,            //show error message (remove this option in production mode)
                productionData: true     //flag that whether the data collected are production data
            });

            //Callback function when AD-Blocker detected.
            abd.setPositiveCallback(function (){
                //e.g. showing blocking message
                var overlay = document.getElementById("abd-overlay");
                overlay.style.display = '';
            });

            //OPTIONAL callback function when AD-Blocker NOT detected.
            abd.setNegativeCallback(function (){
                //e.g. print out detection result
                console.log('AD-Blocker NOT detected.');
            });

            //Start AD-Blocker detection
            abd.checkBlocking();

        </script>
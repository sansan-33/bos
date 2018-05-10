<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div id="tabs-2">
    <br><br>
    <TABLE width="1080px" >
        <form name="sync">
            <tr>
                <td  width="150px;" height="60px;" >
                    <div id="loading" style="border:0px;width:150px;height:60px;" >
                        <p><img src="../img/loading.gif" style="width:50px;height:50px;border:0px;" /> Please Wait</p>
                    </div>
                </td>

                <td valign="top">
                    <input type="button" id="scoring-kindergarten" value="scoring-kindergarten" />
                </td>
                <td valign="top">
                    <input type="button" id="scoring-primary" value="scoring-primary" />
                </td>
                <td valign="top">
                    <input type="button" id="scoring-secondary" value="scoring-secondary" />
                </td>
                <td valign="top">
                    <input type="button" id="scoring-ib" value="scoring-ib" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td valign="top">
                    <input type="button" id="synchronize-kindergarten" value="synchronize-kindergarten" />
                </td>
                <td valign="top">
                    <input type="button" id="synchronize-primary" value="synchronize-primary" />
                </td>
                <td valign="top">
                    <input type="button" id="synchronize-secondary" value="synchronize-secondary" />
                </td>
                <td>No Sync. for IB</td>
            </tr>
        </form>
    </table>

</div>


<script>
      $(document).ready(function(){
      $('#loading').hide();
        $("#scoring-kindergarten").click(function(e){
            e.preventDefault();
            $('#loading').show();

          $.ajax({
                url: "scoring?categoryid=0",
                type: "GET",
                success: function(){
                    console.log("AJAX request was successfull");
                },
                error:function(){
                    console.log("AJAX request was a failure");
                }
              }).done(function(data){
                     $('#loading').hide();
                                   });
        });
        //primary
        $("#scoring-primary").click(function(e){
                    e.preventDefault();
                    $('#loading').show();

                  $.ajax({
                        url: "scoring?categoryid=1",
                        type: "GET",
                        success: function(){
                            console.log("AJAX request was successfull");
                        },
                        error:function(){
                            console.log("AJAX request was a failure");
                        }
                      }).done(function(data){
                             $('#loading').hide();
                                           });
        });
        //scoring secondary
        $("#scoring-secondary").click(function(e){
                    e.preventDefault();
                    $('#loading').show();

                  $.ajax({
                        url: "scoring?categoryid=2",
                        type: "GET",
                        success: function(){
                            console.log("AJAX request was successfull");
                        },
                        error:function(){
                            console.log("AJAX request was a failure");
                        }
                      }).done(function(data){
                             $('#loading').hide();
                                           });
        });
        //scoring IB
        $("#scoring-ib").click(function(e){
                    e.preventDefault();
                    $('#loading').show();

                  $.ajax({
                        url: "scoring?categoryid=5",
                        type: "GET",
                        success: function(){
                            console.log("AJAX request was successfull");
                        },
                        error:function(){
                            console.log("AJAX request was a failure");
                        }
                      }).done(function(data){
                             $('#loading').hide();
                                           });
                  });
    // For Synchronize ====================================================

       $("#synchronize-kindergarten").click(function(e){
                e.preventDefault();
                $('#loading').show();

              $.ajax({
                    url: "synchronize?action=kindergarten",
                    type: "GET",
                    success: function(){
                        console.log("AJAX request was successfull");
                    },
                    error:function(){
                        console.log("AJAX request was a failure");
                    }
                  }).done(function(data){
                         $('#loading').hide();
                                       });
            });
            //primary
            $("#synchronize-primary").click(function(e){
                        e.preventDefault();
                        $('#loading').show();

                      $.ajax({
                            url: "synchronize?action=primary",
                            type: "GET",
                            success: function(){
                                console.log("AJAX request was successfull");
                            },
                            error:function(){
                                console.log("AJAX request was a failure");
                            }
                          }).done(function(data){
                                 $('#loading').hide();
                                               });
            });
            //scoring secondary
            $("#synchronize-secondary").click(function(e){
                        e.preventDefault();
                        $('#loading').show();

                      $.ajax({
                            url: "synchronize?action=secondary",
                            type: "GET",
                            success: function(){
                                console.log("AJAX request was successfull");
                            },
                            error:function(){
                                console.log("AJAX request was a failure");
                            }
                          }).done(function(data){
                                 $('#loading').hide();
                                               });
            });






      });

      </script>
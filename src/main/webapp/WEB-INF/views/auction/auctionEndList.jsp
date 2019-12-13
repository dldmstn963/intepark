<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- Material Design Lite -->
    <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <!-- Material Design icon font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.5.1/min/dropzone.min.css">
 <style>
        .demo-card-wide.mdl-card {
            width: 512px;
        }

        .demo-card-wide>.mdl-card__title {
            color: #fff;
            height: 176px;
            background: url('https://getmdl.io/assets/demos/welcome_card.jpg') center / cover;
        }

        .demo-card-wide>.mdl-card__menu {
            color: #fff;
        }

        body {
            padding: 20px;
            background: #fafafa;
            position: relative;
        }

        .dropzone {
            background: white;
            border-radius: 5px;
            border: 2px dashed rgb(0, 135, 247);
            border-image: none;
            max-width: 500px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
 <!-- Wide card with share menu button -->
  
     
        <div class="mdl-card__supporting-text">
            <form action="auctionEnroll2.do" class="dropzone" id="uploadZone" enctype="multipart/form-data">
                <div class="fallback">
                        <input type="file" id="upfile" name="upfile" multiple="multiple">
                </div>
                
            </form>
        </div>
        <div class="mdl-card__actions mdl-card--border">
            <button id="submitButton" class="mdl-button mdl-js-button mdl-button--accent">
                업로드
            </button>
        </div>
  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.5.1/min/dropzone.min.js"></script>
    <script>
        Dropzone.options.uploadZone = {
            paramName: 'upfile', // 서버에 보낼 데이터이름.
            autoProcessQueue: false, // 자동업로드 해제.
            maxFilesize: 2, // 2mb
            dictDefaultMessage: '여기에 이미지 파일을 드래그하거나 클릭해서 업로드해주세요!',
            maxFiles: 3, // 보낼 최대 파일 수.
            acceptedFiles: 'image/*', // image만

            init: function (e) {

                var myDropzone = this;
                console.log(myDropzone.length);
                $('#submitButton').on("click", function () {
                    if (confirm('정말 업로드하실꺼에요??')) {
                        myDropzone.processQueue(); // 드랍존 프로세스 ㄱㄱ
                    } else {
                        return;
                    }
                });

                myDropzone.on("success", function (file, result) {
                   /*  console.log(result); */ // 서버 응답 메세지 여러 파일을 올리면 각 파일 성공 시 마다 호출된다.
                    console.log("1");
                });

                myDropzone.on("error", function (file, errorMessage, xhr) {
                    // 실패 시 서버 응답은 여기서 캐치.

                    if (xhr) {
                        console.log(xhr.response);
                    }
                });

            }
        };
    </script>
</body>
</html>
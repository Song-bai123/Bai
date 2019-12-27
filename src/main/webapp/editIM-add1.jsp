<%--
  Created by IntelliJ IDEA.
  User: b'y's
  Date: 2019/12/11
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="./js/jquery1.11.3-jquery.min.js"></script>
<script type="text/javascript">
    var cccc = 1;
    //农作物类别
    $(function () {
        $.ajax({
            type: "get",
            url: "showAllCropCategory",
            datetype: "JSON",
            success: function (listl) {
                for (var i = 0; i < listl.length; i++) {
                    $("#cptypes").append(
                        "<option value='" + listl[i].ccId + "'>"
                        + listl[i].cropCategory + "</option>"
                    )
                }
            }
        })
    })

    //农作物原料
    function cptype() {
        $("#cptypess option:gt(0)").remove() //清空原料下拉框
        var cropCategory = $("#cptypes").val();
        if (cropCategory != 0) {
            $.ajax({
                type: "get",
                url: "getCropSpecies",
                datetype: "JSON",
                data: {
                    "csCropCategoryId": cropCategory
                },
                success: function (list1) {
                    for (var i = 0; i < list1.length; i++) {
                        $("#cptypess").append(
                            "<option value='" + list1[i].csId + "'>"
                            + list1[i].csCropSpecies + "</option>"
                        )
                    }
                }
            })
        }
    }

    //省
    window.onload = function () {
        $.ajax({
            type: "get",
            url: "seleaddPro",
            datetype: "JSON",
            success: function (ll) {
                for (var i = 0; i < ll.length; i++) {
                    $("#shen").append(
                        "<option value='" + ll[i].pCode + "'>"
                        + ll[i].pName + "</option>"
                    )
                }
            }
        })
    }

    //市
    function sheng() {
        $("#shi option:gt(0)").remove();
        var pName = $("#shen").val();
        if (pName != 0) {
            $.ajax({
                type: "get",
                url: "/addCity",
                datetype: "JSON",
                data: {"provincecode": pName},
                success: function (addCityL) {
                    for (var i = 0; i < addCityL.length; i++) {
                        $("#shi").append(
                            "<option value='" + addCityL[i].cCode + "'>"
                            + addCityL[i].cName + "</option>"
                        )
                    }
                }
            })
        }
    }

    function selectArea() {
        $("#xian option:gt(0)").remove();
        var cName = $("#shi").val();
        if (cName != 0) {
            $.ajax({
                type: "get",
                url: "/addTown",
                datetype: "JSON",
                data: {citycode: cName},
                success: function (addXian) {
                    for (var i = 0; i < addXian.length; i++) {
                        $("#xian").append(
                            "<option value='" + addXian[i].tCode + "'>"
                            + addXian[i].tName + "</option>"
                        )
                    }
                }
            })
        }
    }

    //查询毒素种类
    $(function () {
        $.ajax({
            type: "POST",
            url: "/seleAl",
            datetype: "JSON",
            success: function (All) {
                console.log(All);
                for (var i = 0; i < All.length; i++) {
                    $("#toxinId").append(
                        "<option value='" + All[i].stiId + "'>"
                        + All[i].toxinType + "</option>"
                    )
                }
            }
        })
    })

    function addtoxin() {
        cccc += 1;
        alert(cccc);
        $(".addds").append('<li class="edittable-middle">' +
            '<div class="editmiddle-left">毒素信息</div>' +
            '<div class="editmiddle-right">' +
            '<ul>' +
            '<li>' +
            '<lable>毒素种类</lable>' +
            '<select name="type1" class="asdas'+cccc+'" id="aa">' +
            '<option value="0" >请选择</option>' +
            '</select>' +
            '<span id="toxin_id" ></span>' +
            '</li>' +
            '<li>' +
            '<lable>毒素含量</lable>' +
            '<input name="toxinCount" type="text"  onblur="checktoxin_count()"  maxlength="10" placeholder="毒素含量最大可输入十位"/>' +
            '<span id="toxin_count" ></span>' +
            '</li>' +
            '<li>' +
            '<a class="del">删除</a>' +
            '</li>' +
            '</ul>' +
            '</div>' +
            '</li>')
        $.ajax({
            url: "/seleAl",
            type: "PDST",
            dataType: "JSON",
            success: function (res) {
                //alert(res);
                for (var j = 0; j < res.length; j++) {
                    $(".asdas"+cccc).append("<option value='" + res[j].stiId + "'>" + res[j].toxinType + "</option>");
                }
            }
        });
    }

    function ABC(){
        $(".add-con").append("<li class='edittable-bottom'>" +
            "<div class='editbottom-left'>产毒菌株信息"+character[i]+"</div>" +
            "<div class='editbottom-right'>" +
            "<ul>" +
            "<li>" +
            "<lable>样品编号</lable>" +
            "<input id='sample_num' name='sampleNum' type='text' class='sample' readonly='readonly' value='"+$('.ypbh').val()+"'/>" +
            "</li>" +
            "<li>" +
            "<lable>菌株原始编号</lable>" +
            "<input name='originalNum' type='text'  class='num'/>" +
            "<span class='err'></span>" +
            "</li>" +
            "<li class='form-a'>" +
            "<lable>文献信息</lable>" +
            "<a class='xz-btn-a'>选择文件</a>" +
            " <input type='text' name='wordAddr' id='' value='' class='file-name-a'  readonly='readonly' placeholder='仅支持doc/docx格式文档'/>" +
            "<input onchange='getPhotoSizes(this)' name='word_addr' type='file' class='file-info-a' accept='.doc,.docx'/>" +
            "</li>" +
            "<li class='form-c'>" +
            "<lable>文本信息</lable>" +
            "<a class='xz-btn-c'>选择文件</a> " +
            "<input   type='text' name='txtAddr' id='' value='' class='file-name-c'  readonly='readonly' placeholder='仅支持txt格式'/>" +
            "<input onchange='getTextSize(this)' name='txt_addr' type='file' class='file-info-c' accept='.txt'/>" +
            "</li>" +
            "<li class='form-b'>" +
            "<lable>图片信息</lable>" +
            "<a class='xz-btn-b'>选择文件</a> " +
            "<input type='text' name='pictureAddr' id='' value='' class='file-name-b'  readonly='readonly' placeholder='仅支持jpg/png格式'/>" +
            "<input onchange='getPhotoSize(this)' name='picture_addr' type='file' class='file-info-b' accept='.png,.jpg,.jpeg'/>" +
            "</li>" +
            "<li>" +
            "<a class='del'>删除</a>" +
            "</li>" +
            "</ul>" +
            "</div>" +
            "</li>");
    }

</script>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑信息</title>
    <link rel="stylesheet" type="text/css" href="../css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../css/editIM.css"/>
    <link rel="stylesheet" href="../css/calendar.css"/>


    <script type="text/javascript" src="../js/calendar.js"></script>
    <script type="text/javascript" src="../js/editIM1.js"></script>
    <script src="./js/checkUpdateIM.js"></script>

    <script type="text/javascript" src="../js/checkUserUpdateForm.js" charset="utf-8"></script>
    <style>
        html, body {
            height: 100%
        }
    </style>

</head>
<body>
<div class="contaner">

    <div class="im-content">
        <div class="im-heade">
            <div class="imhead-title">当前页面：<a>新增信息</a></div>
        </div>
        <form action="/insert" id="search_form" method="post">
            <div class="editim-table">
                <ul class="table-con">
                    <li class="edittable-top">
                        <div class="edittable-left">采样信息</div>
                        <div class="edittable-right">
                            <ul>

                                <li>
                                    <lable>样品编号</lable>
                                    <input class="ypbh" name="sampleId" placeholder="首字母英文，长度为5-15位" value=""
                                           maxlength="15" type="text"
                                           id="sample_id">
                                </li>
                                <li>
                                    <lable>农产品加工原料类别</lable>
                                    <select class="sel" onchange="cptype()" name="cropCategoryId" id="cptypes">
                                        <option value="0">请选择</option>
                                    </select>
                                    <span id="crop_category_id"></span>
                                </li>
                                <li>
                                    <lable>品种</lable>
                                    <select class="sel" name="breed" id="cptypess" onchange="getCptypess()">
                                        <option class="cpzl" value="0">请选择</option>
                                    </select>
                                    <span id="breed"></span>
                                </li>


                                <li>
                                    <div class="width">
                                        <lable>地点</lable>
                                        <input value="北京" id="shengs" type="hidden">
                                        <input value="北京市" id="shisss" type="hidden">
                                        <input value="东城区" id="xiansss" type="hidden">

                                        <select class="province" id="shen" name="province" onchange="sheng()">
                                            <option class="shengde" selected="selected" value="">请选择</option>
                                        </select><span>省</span>
                                        <select class="city" id="shi" name="city" onchange="selectArea()">
                                            <option value="0" selected="selected" class="shide">请选择</option>
                                        </select><span>市</span>
                                        <select class="county" id="xian" name="county" onchange="xian()">
                                            <option value="0" class="xiande">请选择</option>
                                        </select><span>县</span>
                                        <span id="province"></span>
                                    </div>
                                    <span class="xc">
											<input placeholder="可为空" id="xiang" name="township" value="" type="text">乡
											<input placeholder="可为空" id="cun" name="village" value="" type="text">村
											<input placeholder="可为空" id="hu" name="household" value=""
                                                   type="text"><span>户</span>
										</span>

                                </li>

                                <li>
                                    <lable>收获时间</lable>
                                    <input name="harvestTimeA" id="dt" value="" readonly="readonly" placeholder="选择日期"
                                           type="">
                                    <div style="width: 280px; height: 330px; left: 549.65px; top: 351px; z-index: 999; display: none;"
                                         class="calendar calendar-modal calendar-d" id="dd">
                                        <div style="width: 280px;" class="calendar-inner">
                                            <div class="calendar-views">
                                                <div style="width: 280px;" class="view view-date">
                                                    <div class="calendar-hd">
                                                        <a href="javascript:;" data-calendar-display-date=""
                                                           class="calendar-display">2018/<span class="m">3</span></a>
                                                        <div class="calendar-arrow"><span class="prev" title="上一月"
                                                                                          data-calendar-arrow-date="">&lt;</span>
                                                            <span class="next" title="下一月" data-calendar-arrow-date="">&gt;</span>
                                                        </div>
                                                    </div>
                                                    <div style="width: 280px; height: 280px;" class="calendar-ct">
                                                        <ol class="week">
                                                            <li style="width:40px;height:40px;line-height:40px">日</li>
                                                            <li style="width:40px;height:40px;line-height:40px">一</li>
                                                            <li style="width:40px;height:40px;line-height:40px">二</li>
                                                            <li style="width:40px;height:40px;line-height:40px">三</li>
                                                            <li style="width:40px;height:40px;line-height:40px">四</li>
                                                            <li style="width:40px;height:40px;line-height:40px">五</li>
                                                            <li style="width:40px;height:40px;line-height:40px">六</li>
                                                        </ol>
                                                        <ul class="date-items">
                                                            <li style="width: 280px;">
                                                                <ol class="days">
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">28
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">29
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">30
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">31
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">1
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">2
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">3
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">4
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">5
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">6
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">7
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">8
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">9
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">10
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">11
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">12
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">13
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">14
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">15
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">16
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">17
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">18
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">19
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">20
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">21
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">22
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">23
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">24
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">25
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">26
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">27
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">28
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">1
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">2
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">3
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">4
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">5
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">6
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">7
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">8
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">9
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">10
                                                                    </li>
                                                                </ol>
                                                            </li>
                                                            <li style="width: 280px;">
                                                                <ol class="days">
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">25
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">26
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">27
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">28
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">1
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">2
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">3
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">4
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">5
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">6
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">7
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">8
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">9
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">10
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">11
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">12
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">13
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">14
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">15
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">16
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">17
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">18
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class=" now" data-calendar-day="">19
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">20
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">21
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">22
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">23
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">24
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">25
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">26
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">27
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">28
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">29
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">30
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">31
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">1
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">2
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">3
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">4
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">5
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">6
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">7
                                                                    </li>
                                                                </ol>
                                                            </li>
                                                            <li style="width: 280px;">
                                                                <ol class="days">
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">25
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">26
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">27
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">28
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">29
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">30
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">31
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">1
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">2
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">3
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">4
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">5
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">6
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">7
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">8
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">9
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">10
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">11
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">12
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">13
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">14
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">15
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">16
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">17
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">18
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">19
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">20
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">21
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">22
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">23
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">24
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">25
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">26
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">27
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">28
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">29
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">30
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">1
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">2
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">3
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">4
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">5
                                                                    </li>
                                                                </ol>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div style="width: 280px;" class="view view-month">
                                                    <div class="calendar-hd"><a href="javascript:;"
                                                                                data-calendar-display-month=""
                                                                                class="calendar-display">2018</a>
                                                        <div class="calendar-arrow"><span class="prev" title="上一年"
                                                                                          data-calendar-arrow-month="">&lt;</span><span
                                                                class="next" title="下一年" data-calendar-arrow-month="">&gt;</span>
                                                        </div>
                                                    </div>
                                                    <ol style="width: 280px; height: 280px;"
                                                        class="calendar-ct month-items">
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">1月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">2月
                                                        </li>
                                                        <li class="now" style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">3月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">4月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">5月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">6月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">7月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">8月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">9月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">10月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">11月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">12月
                                                        </li>
                                                    </ol>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="calendar-label"><p>HelloWorld</p><i></i></div>
                                    </div>
                                    <span class="err"></span>
                                </li>
                                <!-- onblur="checksampling_time()" -->
                                <li>
                                    <lable>取样时间</lable>
                                    <input name="samplingTimeA" id="dt-b" value="" readonly="readonly"
                                           placeholder="选择日期" type="">
                                    <div style="width: 280px; height: 330px; left: 549.65px; top: 393px; z-index: 999; display: none;"
                                         class="calendar calendar-modal calendar-d" id="dd-b">
                                        <div style="width: 280px;" class="calendar-inner">
                                            <div class="calendar-views">
                                                <div style="width: 280px;" class="view view-date">
                                                    <div class="calendar-hd"><a href="javascript:;"
                                                                                data-calendar-display-date=""
                                                                                class="calendar-display">2018/<span
                                                            class="m">3</span></a>
                                                        <div class="calendar-arrow"><span class="prev" title="上一月"
                                                                                          data-calendar-arrow-date="">&lt;</span><span
                                                                class="next" title="下一月" data-calendar-arrow-date="">&gt;</span>
                                                        </div>
                                                    </div>
                                                    <div style="width: 280px; height: 280px;" class="calendar-ct">
                                                        <ol class="week">
                                                            <li style="width:40px;height:40px;line-height:40px">日</li>
                                                            <li style="width:40px;height:40px;line-height:40px">一</li>
                                                            <li style="width:40px;height:40px;line-height:40px">二</li>
                                                            <li style="width:40px;height:40px;line-height:40px">三</li>
                                                            <li style="width:40px;height:40px;line-height:40px">四</li>
                                                            <li style="width:40px;height:40px;line-height:40px">五</li>
                                                            <li style="width:40px;height:40px;line-height:40px">六</li>
                                                        </ol>
                                                        <ul class="date-items">
                                                            <li style="width: 280px;">
                                                                <ol class="days">
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">28
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">29
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">30
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">31
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">1
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">2
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">3
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">4
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">5
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">6
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">7
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">8
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">9
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">10
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">11
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">12
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">13
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">14
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">15
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">16
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">17
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">18
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">19
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">20
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">21
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">22
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">23
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">24
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">25
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">26
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">27
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">28
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">1
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">2
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">3
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">4
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">5
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">6
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">7
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">8
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">9
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">10
                                                                    </li>
                                                                </ol>
                                                            </li>
                                                            <li style="width: 280px;">
                                                                <ol class="days">
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">25
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">26
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">27
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">28
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">1
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">2
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">3
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">4
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">5
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">6
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">7
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">8
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">9
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">10
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">11
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">12
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">13
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">14
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">15
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">16
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">17
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">18
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class=" now" data-calendar-day="">19
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">20
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">21
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">22
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">23
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">24
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">25
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">26
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">27
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">28
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">29
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">30
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">31
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">1
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">2
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">3
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">4
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">5
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">6
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">7
                                                                    </li>
                                                                </ol>
                                                            </li>
                                                            <li style="width: 280px;">
                                                                <ol class="days">
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">25
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">26
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">27
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">28
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">29
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">30
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="old" data-calendar-day="">31
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">1
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">2
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">3
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">4
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">5
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">6
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">7
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">8
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">9
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">10
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">11
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">12
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">13
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">14
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">15
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">16
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">17
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">18
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">19
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">20
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">21
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">22
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">23
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">24
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">25
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">26
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">27
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">28
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">29
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="" data-calendar-day="">30
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">1
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">2
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">3
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">4
                                                                    </li>
                                                                    <li style="width:40px;height:40px;line-height:40px"
                                                                        class="new" data-calendar-day="">5
                                                                    </li>
                                                                </ol>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div style="width: 280px;" class="view view-month">
                                                    <div class="calendar-hd"><a href="javascript:;"
                                                                                data-calendar-display-month=""
                                                                                class="calendar-display">2018</a>
                                                        <div class="calendar-arrow"><span class="prev" title="上一年"
                                                                                          data-calendar-arrow-month="">&lt;</span><span
                                                                class="next" title="下一年" data-calendar-arrow-month="">&gt;</span>
                                                        </div>
                                                    </div>
                                                    <ol style="width: 280px; height: 280px;"
                                                        class="calendar-ct month-items">
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">1月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">2月
                                                        </li>
                                                        <li class="now" style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">3月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">4月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">5月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">6月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">7月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">8月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">9月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">10月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">11月
                                                        </li>
                                                        <li style="width:70px;height:70px;line-height:70px"
                                                            data-calendar-month="">12月
                                                        </li>
                                                    </ol>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="calendar-label"><p>HelloWorld</p><i></i></div>
                                    </div>
                                    <span class="err"></span>
                                </li>

                                <li>
                                    <lable>取样人</lable>
                                    <input maxlength="15" placeholder="请输入取样人姓名" name="samplingPeople" id="" value=""
                                           type="">
                                    <span id="sampling_people"></span>
                                </li>
                                <li class="jijie">
                                    <lable>采集季节及气候特征</lable>
                                    <textarea name="Seasonal" id="seasonal1" rows="" cols=""></textarea>
                                    <span id="seasonal"></span>
                                </li>
                                <li class="huanjing">
                                    <lable>采集地、环境信息描述</lable>
                                    <textarea name="description" id="description1" rows="" cols=""></textarea>
                                    <span id="description"></span>
                                </li>
                                <li>
                                    <lable>真菌污染率</lable>
                                    <input name="pollutionRate" id="" value="" maxlength="5" placeholder="不需要输入'%'"
                                           type="">
                                    <span id="pollution_rate"></span>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <div class="addds">
                        <li class="edittable-middle">
                            <div class="editmiddle-left">毒素信息</div>

                            <div class="editmiddle-right">
                                <ul>
                                    <li>
                                        <lable>毒素种类</lable>
                                        <select name="type1" id="toxinId" onclick="Du()">
                                            <option value="0">请选择</option>
                                        </select>
                                        <span id="toxin_id"></span>
                                    </li>
                                    <li>
                                        <lable>毒素含量</lable>
                                        <input name="toxinCount" maxlength="10" placeholder="毒素含量最大可输入十位" type="text">
                                        <span id="toxin_count"></span>
                                    </li>
                                    <li>
                                        <a class="del">删除</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </div>
                    <div class="add-dsxx" onclick="addtoxin()">+添加毒素信息</div>

                    <div class="add-con">

                    </div>
                    <div class="add-ds add" onclick="ABC()" >+添加产毒菌株信息</div>
                </ul>



                <div class="footer">
                    <!-- <a onclick="history.go(-1)" class="marginl">返回</a> -->
                    <%--<button href="/Sample" class="baocun" onclick="sub()">保存</button>--%>
                    <input type="submit" value="保存"/>
                    <a onclick="history.go(-1)" class="marginl"
                       href="javascript:if(confirm('确实要放弃操作吗?返回之后，所添加数据不会保存！'))location='/glory/rest/iddeleteyangpin?id=754'">返回</a>
                </div>
            </div>
        </form>
    </div>
</div>

</body>


</html>
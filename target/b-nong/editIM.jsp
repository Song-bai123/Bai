<%--
  Created by IntelliJ IDEA.
  User: b'y's
  Date: 2019/12/9
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="./js/jquery1.11.3-jquery.min.js"></script>
<script type="text/javascript">
    var cccc = 1;
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


    // //查询毒素种类
    // $(function () {
    //     $.ajax({
    //         type: "POST",
    //         url: "/seleAl",
    //         datetype: "JSON",
    //         success: function (All) {
    //             console.log(All);
    //             for (var i = 0; i < All.length; i++) {
    //                 $("#toxinId").append(
    //                     "<option value='" + All[i].stiId + "'>"
    //                     + All[i].toxinType + "</option>"
    //                 )
    //             }
    //         }
    //     })
    // })


    function addtoxin() {
        //alert(1);
        cccc += 1;
        $(".addds").append('<li class="edittable-middle">' +
            '<div class="editmiddle-left">毒素信息</div>' +
            '<div class="editmiddle-right">' +
            '<ul>' +
            '<li>' +
            '<lable>毒素种类</lable>' +
            '<select name="type1" class="asdas' + cccc + '" id="aa">' +
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
            type: "POST",
            dataType: "JSON",
            success: function (aa) {
                //alert(aa);
                for (var i = 0; i < aa.length; i++) {
                    $(".asdas"+cccc).append("<option value='" + aa[i].stiId + "'>" + aa[i].toxinType + "</option>");
                }
            }
        });
    }

    // function ABC(){
    //     $(".add-con").append("<li class='edittable-bottom'>" +
    //         "<div class='editbottom-left'>产毒菌株信息"+character[i]+"</div>" +
    //         "<div class='editbottom-right'>" +
    //         "<ul>" +
    //         "<li>" +
    //         "<lable>样品编号</lable>" +
    //         "<input id='sample_num' name='sampleNum' type='text' class='sample' readonly='readonly' value='"+$('.ypbh').val()+"'/>" +
    //         "</li>" +
    //         "<li>" +
    //         "<lable>菌株原始编号</lable>" +
    //         "<input name='originalNum' type='text'  class='num'/>" +
    //         "<span class='err'></span>" +
    //         "</li>" +
    //         "<li class='form-a'>" +
    //         "<lable>文献信息</lable>" +
    //         "<a class='xz-btn-a'>选择文件</a>" +
    //         " <input type='text' name='wordAddr' id='' value='' class='file-name-a'  readonly='readonly' placeholder='仅支持doc/docx格式文档'/>" +
    //         "<input onchange='getPhotoSizes(this)' name='word_addr' type='file' class='file-info-a' accept='.doc,.docx'/>" +
    //         "</li>" +
    //         "<li class='form-c'>" +
    //         "<lable>文本信息</lable>" +
    //         "<a class='xz-btn-c'>选择文件</a> " +
    //         "<input   type='text' name='txtAddr' id='' value='' class='file-name-c'  readonly='readonly' placeholder='仅支持txt格式'/>" +
    //         "<input onchange='getTextSize(this)' name='txt_addr' type='file' class='file-info-c' accept='.txt'/>" +
    //         "</li>" +
    //         "<li class='form-b'>" +
    //         "<lable>图片信息</lable>" +
    //         "<a class='xz-btn-b'>选择文件</a> " +
    //         "<input type='text' name='pictureAddr' id='' value='' class='file-name-b'  readonly='readonly' placeholder='仅支持jpg/png格式'/>" +
    //         "<input onchange='getPhotoSize(this)' name='picture_addr' type='file' class='file-info-b' accept='.png,.jpg,.jpeg'/>" +
    //         "</li>" +
    //         "<li>" +
    //         "<a class='del'>删除</a>" +
    //         "</li>" +
    //         "</ul>" +
    //         "</div>" +
    //         "</li>");
    // }




</script>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑信息</title>
    <link rel="stylesheet" type="text/css" href="./css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="./css/editIM.css"/>
    <link rel="stylesheet" href="css/calendar.css" />

    <script src="/js/jquery.js"></script>
    <script type="text/javascript" src="./js/calendar.js"></script>
    <script src="./js/editIM.js"></script>
    <script src="./js/checkUpdateIM.js"></script>
    <script type="text/javascript" src="./js/checkUserUpdateForm.js" charset="utf-8"></script>
    <style>
        html,body{height: 100%}
    </style>

</head>
<body>



<div class="contaner">

    <div class="im-content">
        <div class="im-heade">
            <div class="imhead-title">当前页面：<a>修改信息</a></div>
        </div>
        <form action="/update" id="search_form" enctype="multipart/form-data" method="post" accept-charset="utf-8">
            <div class="editim-table">
                <ul class="table-con">
                    <li class="edittable-top">
                        <div class="edittable-left">采样信息</div>
                        <div class="edittable-right">
                            <ul>
                                <li>


                                    <lable>样品编号</lable>
                                    <input name="sampleId" placeholder="首字母为英文，长度为5-15位" id="sample_id" class="ypbh" value="${All.sampleId}" type="text">
                                    <span id="sampleId"></span>

                                </li>
                                <li>
                                    <input name="siId"  value="${All.siId}" type="hidden">
                                    <lable>农产品加工原料类别</lable>
                                    <select class="sel" onchange="cptype()" name="cropCategoryId" id="cptypes" value="">
                                        <option value="${All.cc.ccId}" selected="selected">${All.cc.cropCategory}</option>
                                    </select>
                                    <span id="crop_category_id"></span>
                                </li>
                                <li>
                                    <lable>品种</lable>
                                    <select name="breed" class="sele" id="cptypess">
                                        <option class="selec" value="${All.cs.csId}" selected="selected">${All.cs.csCropSpecies}</option>
                                    </select>
                                    <span id="breed"></span>
                                </li>
                                <li>
                                    <div class="width">
                                        <lable>地点</lable>
                                        <input value="北京" id="shengs" type="hidden">
                                        <input value="北京市" id="shisss" type="hidden">
                                        <input value="东城区" id="xiansss" type="hidden">

                                        <select class="province" id="shen" onchange="sheng()" name="province">
                                            <option class="shengde" selected="selected" value="${ll.addP.pCode}">${ll.addP.pName}</option>
                                            </select><span>省</span>
                                        <select class="city" onblur="checkprovince()" id="shi" onchange="selectArea()" name="city">
                                            <option selected="selected" class="shide" value="${cc.addC.cCode}">${cc.addC.cName}</option>
                                        </select><span>市</span>
                                        <select onblur="checkprovince()" class="county" id="xian" onchange="xian()" name="county">
                                            <option  class="xiande" value="${tt.addT.tCode}">${tt.addT.tName}</option>
                                        </select>
                                    </div>
                                    <span class="xc">
											<input placeholder="可为空" id="xiang" name="township" value="" type="text">乡
											<input placeholder="可为空" id="cun" name="village" value="" type="text">村
											<input placeholder="可为空" id="hu" name="household" value="" type="text"><span>户</span>
										</span>
                                    <span id="province"></span>
                                </li>

                                <li>
                                    <lable>收获时间</lable>
                                    <input name="harvestTimeA" value="<fmt:formatDate value='${All.harvestTime}' pattern='yyyy-MM-dd'/>" id="harvestTime" type="date"/>

                                </li>
                                <li>
                                    <lable>取样时间</lable>
                                    <input name="samplingTimeA" value="<fmt:formatDate value='${All.samplingTime}' pattern='yyyy-MM-dd'/>" id="sampling_time" type="date"/>


                                </li>
                                <li>
                                    <lable>取样人</lable>
                                    <input placeholder="请输入取样人姓名" name="samplingPeople"  value="${All.samplingPeople}" type="">
                                    <span id="sampling_people"></span>
                                </li>
                                <li class="jijie">
                                    <lable>采集季节及气候特征</lable>
                                    <textarea name="Seasonal" id="seasonal1" rows="" cols="">${All.seasonal}</textarea>
                                    <span id="seasonal"></span>
                                </li>
                                <li class="huanjing">
                                    <lable>采集地、环境信息描述</lable>
                                    <textarea name="description" id="description1" rows="" cols="">${All.description}</textarea>
                                    <span id="description"></span>
                                </li>
                                <li>
                                    <lable>真菌污染率</lable>
                                    <input name="pollutionRate" id="" value="${All.pollutionRate}" type="">
                                    <span id="pollution_rate"></span>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <div class="addds">
                        <c:forEach items="${All.st}" var="toxin">
                        <li class="edittable-middle">
                            <div class="editmiddle-left">毒素信息 </div>
                            <div class="editmiddle-right">
                                <ul>
                                    <li>
                                            <lable>毒素种类</lable>
                                            <select name="type1" id="toxinId" onclick="Du()">
                                                <c:forEach items="${stt}" var="stt1">
                                                <option value="${stt1.stiId}"
                                                        <c:if test="${stt1.stiId == toxin.stiId}">selected</c:if>
                                                >${stt1.toxinType}</option>
                                                </c:forEach>
                                            </select>
                                            <span id="toxin_id"></span>
                                        </li>
                                    <li>
                                        <lable>毒素含量</lable>
                                        <input name="toxinCount" value="${toxin.toxinCount}" type="text">
                                        <span id="toxin_count"></span>
                                    </li>
                                    <li>
                                        <a  class="del" >删除</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        </c:forEach>
                    </div>

                    <div class="add-dsxx"  >+添加毒素信息</div>
                    <div class="add-con">
                        <c:forEach items="${bsi}" var="bb">
                        <li class="edittable-bottom">
                            <div class="editbottom-left">产毒菌株信息</div>
                            <div class="editbottom-right">
                                <ul>
                                    <li>
                                        <lable>样品编号</lable>
                                        <input name="sampleNum" value="${All.sampleId}" class="sample" type="text">
                                    </li>
                                    <li>
                                        <lable>菌株原始编号</lable>
                                        <input name="originalNum" value="${bb.originalNum}" class="num" type="text">
                                    </li>
                                    <li class="form-a">
                                        <lable>文献信息</lable>
                                        <a class="xz-btn-a">选择文件</a>
                                        <input placeholder="仅支持doc/docx格式" name="wordAddr"  value="${bb.wordAddr}" class="file-name-a" readonly="readonly" type="text">
                                        <input name="wordvalues" class="file-info-a" type="file">
                                    </li>
                                    <li class="form-b">
                                        <lable>文本信息</lable>
                                        <a class="xz-btn-b">选择文件</a>
                                        <input placeholder="仅支持txt格式" value="${bb.txtAddr}" name="txtAddr"  class="file-name-b" readonly="readonly" type="text">
                                        <input name="txtvalues" value="0" class="file-info-b" type="file">
                                    </li>
                                    <li class="form-c">
                                        <lable>图片信息</lable>
                                        <a class="xz-btn-c">选择文件</a>
                                        <input placeholder="仅支持jpg/png格式" value="${bb.pictureAddr}" name="pictureAddr"  class="file-name-c" readonly="readonly" type="text">
                                        <input name="imgvalues" value="0" class="file-info-c" type="file">
                                    </li>
                                    <li>
                                        <a onclick="qwe(6);" class="del">删除</a>
                                    </li>
                                </ul>
                            </div>

                        </li>
                        </c:forEach>
                    </div>
                    <div class="add-ds add" onclick="ABC()">+添加产毒菌株信息</div>
                </ul>
                <div class="footer">
                    <input type="submit" value="提交"/>
                        <%--<button  class="baocun" onclick="NGB()">修改</button>--%>
                    <a onclick="history.go(-1)" class="marginl" href="javascript:if(confirm('确实要放弃操作吗?返回之后，所添加数据不会保存！'))location='/glory/rest/iddeleteyangpin?id=754'">返回</a>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
</body>
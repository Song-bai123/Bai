package com.it.controller;

import com.it.Util.ExcelUtil;
import com.it.Util.ExcelUtils;
import com.it.bean.*;
import com.it.service.SampieService;
import javafx.scene.chart.PieChart;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Controller
public class InFoController {

        @Autowired
        private SampieService sampieService;


//    @RequestMapping("/selectAll")
//    @ResponseBody
//    public List<Province> selectAll(){
//        List<Province> provinces = provinceService.selectAll();
//        return  provinces;
//    }
//
//    @ResponseBody
//    @RequestMapping("/selectcity")
//    public List<City> selectcity(@RequestParam("citycode")String citycode){
//        //前台的参数传到后台都是字符串类型的
//        List<City> cities = provinceService.selectByProCode(citycode);
//        return  cities;
//    }
//
//
//
//	@RequestMapping("/toIndex")
//	public String toIndex(@RequestParam("name")String name){
//		String message = "login";
//		if(name.equals("王五")){
//			message = "index";
//		}
//		return message;
//	}
//
//	@ResponseBody
//	@RequestMapping("/save")
//	public void save(Student student){
//        System.out.println(student);
//	}
//
//
//
//    @ResponseBody
//    @RequestMapping("/findAll")
//    public List<Student> findAll(){
//        List<Student> selectAll = StudentService.selectAll();
//        return selectAll;
//    }
//
        /**
         * 导出报表
         * @return
         */

        @RequestMapping("/export")
        public String export(HttpServletRequest request, HttpServletResponse response) throws Exception {

            String message = "";

            //获取数据
            List<sample_info> list = sampieService.SinFo();

            //excel标题
            String[] title = {"样品编号","地点","农产品加工类型","取样时间","真菌污染率","主要毒素"};

            //excel文件名
            String fileName = "样品信息表"+System.currentTimeMillis()+".xls";

            //sheet名
            String sheetName = "样品信息表";

            String [][] content = new String[list.size()][];
            for (int i = 0; i < list.size(); i++) {
                content[i] = new String[title.length];
                sample_info info = list.get(i);
                content[i][0] = info.getSampleId()+"";
                content[i][1] =  info.getAddP().getpName()+"-"+info.getAddC().getcName()+"-"+info.getAddT().gettName()+"";
                content[i][2] = info.getBreed()+"";
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                content[i][3] = sdf.format(info.getSamplingTime());
                content[i][4] = info.getPollutionRate()+"";
                content[i][5] = info.getToxinsStr()+"";

            }

            //创建HSSFWorkbook
            HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, null);

            //响应到客户端
            try {
                this.setResponseHeader(response, fileName);
                OutputStream os = response.getOutputStream();
                wb.write(os);
                os.flush();
                os.close();
                message = "SUCCESS";
            } catch (Exception e) {
                e.printStackTrace();
                message = "ERROR";
            }

            return null;
        }

        //发送响应流方法
        public void setResponseHeader(HttpServletResponse response, String fileName) {
            try {
                try {
                    fileName = new String(fileName.getBytes(),"utf-8");
                } catch (UnsupportedEncodingException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                response.setContentType("application/octet-stream;charset=utf-8");
                response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
                response.addHeader("Pargam", "no-cache");
                response.addHeader("Cache-Control", "no-cache");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

   @RequestMapping("/poiinto")
    public void poiinto(@RequestParam("file") MultipartFile file){
        /*    	MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
         */    	//获取你导入的文件
        /*MultipartFile multipartFile = multipartHttpServletRequest.getFile("file");*/

        List<List<Object>> list = null;
        try {
            list = ExcelUtils.getExcelList(file.getInputStream(),file.getOriginalFilename());
            System.err.println(file.getOriginalFilename());
       } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        for (int i = 0; i < list.size(); i++) {
            List<Object> li = list.get(i);
            sample_info stu = new sample_info();
            //样品编号
            stu.setSampleId(li.get(0).toString());

            //原料类别
            String breed = li.get(1).toString();
            crop_species ccs = sampieService.seleCs(breed);
            stu.setBreed(Integer.valueOf(ccs.getCsId()));
            //是否取样
            String flag = li.get(2).toString();
            stu.setFlag(Integer.valueOf(flag));
            //品种
            String cropCategoryId = li.get(3).toString();
            crop_category ccc = sampieService.ccc(ccs.getCsId());
            stu.setCropCategoryId(Integer.valueOf(ccc.getCcId()));
            //省
            String pName = li.get(4).toString();
            address_province ap = sampieService.ap(pName);
            stu.setProvince(ap.getpCode());
            //市
            String cName = li.get(5).toString();
            address_city ac = sampieService.ac(cName);
            stu.setCity(ac.getcCode());
            //县
            String tName = li.get(6).toString();
            address_town att = sampieService.att(tName);
            stu.setCounty(att.gettCode());

            String hu = li.get(9).toString();
            if (hu==null){
                stu.setHousehold("");
            }

            //收获时间
            String times = li.get(10).toString();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  //转换什么格式的String时间，此处格式需要和它保持一致
            try {
                Date date = sdf.parse(times);
                stu.setHarvestTime(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            //取样时间
            String sampling_time = li.get(11).toString();
            SimpleDateFormat sdft = new SimpleDateFormat("yyyy-MM-dd");  //转换什么格式的String时间，此处格式需要和它保持一致
            try {
                Date date = sdft.parse(sampling_time);
                stu.setSamplingTime(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            //取样人
            String samplingPeople = li.get(12).toString();
            stu.setSamplingPeople(samplingPeople);
        }
    }
}


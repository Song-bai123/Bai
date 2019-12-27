package com.it.bean;

import java.util.Date;
import java.util.List;

public class sample_info {

        private Integer siId;
        //样品编号
        private String sampleId;
        //农产品加工原料类别id
        private Integer cropCategoryId;
        //品种
        private Integer breed;
        //省
        private String province;
        //市
        private String city;
        //县
        private String county;
        //乡
        private String township;
        //村
        private String village;
        //户
        private String household;
        //收货时间
        private Date harvestTime;
        //取样时间
        private Date samplingTime;
        //取样人
        private String samplingPeople;
        //真菌污染率
        private Float pollutionRate;
        //创建时间
        private Date createTime;
        //是否删除0未删除1删除
        private Integer isdel;
        //录入时间
        private Date inputTime;
        //导入：是否取样
        private Integer flag;
        //录入人（信息管理员）
        private Integer enterpeople;
        //导入品种字段
        private String varieties;

        private String Dumz;
        //采集时季节及气候特征
        private String Seasonal;
        //采集地、环境信息描述
        private String description;

        private String harvestTimeA;

        private String samplingTimeA;

        private String toxinsStr;

        private List<bacterial_strain_info> Bsi;

        private List<sample_toxin> st;

        private List<sample_toxin_info> sti;

        private crop_category cc;

        private crop_species cs;

        private address_province addP;

        private address_city addC;

        private address_town addT;

    public address_province getAddP() {
        return addP;
    }

    public void setAddP(address_province addP) {
        this.addP = addP;
    }

    public address_city getAddC() {
        return addC;
    }

    public void setAddC(address_city addC) {
        this.addC = addC;
    }

    public address_town getAddT() {
        return addT;
    }

    public void setAddT(address_town addT) {
        this.addT = addT;
    }

    public crop_category getCc() {
        return cc;
    }

    public void setCc(crop_category cc) {
        this.cc = cc;
    }

    public crop_species getCs() {
        return cs;
    }

    public void setCs(crop_species cs) {
        this.cs = cs;
    }

    public List<bacterial_strain_info> getBsi() {
        return Bsi;
    }

    public void setBsi(List<bacterial_strain_info> bsi) {
        this.Bsi = bsi;
    }

    public String getHarvestTimeA() {
        return harvestTimeA;
    }

    public void setHarvestTimeA(String harvestTimeA) {
        this.harvestTimeA = harvestTimeA;
    }

    public String getSamplingTimeA() {
        return samplingTimeA;
    }

    public void setSamplingTimeA(String samplingTimeA) {
        this.samplingTimeA = samplingTimeA;
    }

    public String getSeasonal() {
            return Seasonal;
        }

        public void setSeasonal(String seasonal) {
            Seasonal = seasonal;
        }

        public String getDescription() {
            return description;
        }

        public void setDescription(String description) {
            this.description = description;
        }


        public List<sample_toxin_info> getSti() {
            return sti;
        }



        public String getToxinsStr() {
            return toxinsStr;
        }

        public void setToxinsStr(String toxinsStr) {
            this.toxinsStr = toxinsStr;
        }

        public void setSti(List<sample_toxin_info> sti) {
            this.sti = sti;
        }

        public String getDumz() {
            return Dumz;
        }

        public void setDumz(String dumz) {
            Dumz = dumz;
        }

        public List<sample_toxin> getSt() {
            return st;
        }

        public void setSt(List<sample_toxin> st) {
            this.st = st;
        }


        public String getSampleId() {
            return sampleId;
        }

        public void setSampleId(String sampleId) {
            this.sampleId = sampleId == null ? null : sampleId.trim();
        }

        public Integer getCropCategoryId() {
            return cropCategoryId;
        }

        public void setCropCategoryId(Integer cropCategoryId) {
            this.cropCategoryId = cropCategoryId;
        }

        public Integer getBreed() {
            return breed;
        }

        public void setBreed(Integer breed) {
            this.breed = breed;
        }

        public String getProvince() {
            return province;
        }

        public void setProvince(String province) {
            this.province = province == null ? null : province.trim();
        }

        public String getCity() {
            return city;
        }

        public void setCity(String city) {
            this.city = city == null ? null : city.trim();
        }

        public String getCounty() {
            return county;
        }

        public void setCounty(String county) {
            this.county = county == null ? null : county.trim();
        }

        public String getTownship() {
            return township;
        }

        public void setTownship(String township) {
            this.township = township == null ? null : township.trim();
        }

        public String getVillage() {
            return village;
        }

        public void setVillage(String village) {
            this.village = village == null ? null : village.trim();
        }

        public String getHousehold() {
            return household;
        }

        public void setHousehold(String household) {
            this.household = household == null ? null : household.trim();
        }

        public Date getHarvestTime() {
            return harvestTime;
        }

        public void setHarvestTime(Date harvestTime) {
            this.harvestTime = harvestTime;
        }

        public Date getSamplingTime() {
            return samplingTime;
        }

        public void setSamplingTime(Date samplingTime) {
            this.samplingTime = samplingTime;
        }

        public String getSamplingPeople() {
            return samplingPeople;
        }

        public void setSamplingPeople(String samplingPeople) {
            this.samplingPeople = samplingPeople == null ? null : samplingPeople.trim();
        }

        public Float getPollutionRate() {
            return pollutionRate;
        }

        public void setPollutionRate(Float pollutionRate) {
            this.pollutionRate = pollutionRate;
        }

        public Date getCreateTime() {
            return createTime;
        }

        public void setCreateTime(Date createTime) {
            this.createTime = createTime;
        }

        public Integer getIsdel() {
            return isdel;
        }

        public void setIsdel(Integer isdel) {
            this.isdel = isdel;
        }

        public Date getInputTime() {
            return inputTime;
        }

        public void setInputTime(Date inputTime) {
            this.inputTime = inputTime;
        }

        public Integer getFlag() {
            return flag;
        }

        public void setFlag(Integer flag) {
            this.flag = flag;
        }

        public Integer getEnterpeople() {
            return enterpeople;
        }

        public void setEnterpeople(Integer enterpeople) {
            this.enterpeople = enterpeople;
        }

        public String getVarieties() {
            return varieties;
        }

        public void setVarieties(String varieties) {
            this.varieties = varieties == null ? null : varieties.trim();
        }


        public Integer getSiId() {
            return siId;
        }

        public void setSiId(Integer siId) {
            this.siId = siId;
        }



        public sample_info() {

        }


}
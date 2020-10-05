/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package kr.quantumsoft.koreasurvey.model;

import java.util.Date;

/**
 * @author QuantumSoft Inc.
 * @version 1.0
 * @Class Name : Tradings.java
 * @Project Name : koreasurvey
 * @Description :
 * @Modification Information
 * @
 * @ 수정일      수정자              수정내용
 * @ ------------   ---------   -------------------------------
 * @ 2020. 5. 28.                     최초생성
 * @see Copyright (C) by QuantumSoft Inc. All right reserved.
 * @since 2015. 8.
 */
public class Tradings {
    private Integer id;
    private Integer userid;
    private Integer type;    // -1: 소비, 0: 현금 충전, 1: 카드 충전, 2: 배당 충전
    private Integer amount;
    private Integer recommanderid;
    private String recommanderemail;
    private Integer withdrawsid;
    private Date created;
    private Withdraw withdraw;

    public Withdraw getWithdraw() {
        return withdraw;
    }

    public void setWithdraw(Withdraw withdraw) {
        this.withdraw = withdraw;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Integer getRecommanderid() {
        return recommanderid;
    }

    public void setRecommanderid(Integer recommanderid) {
        this.recommanderid = recommanderid;
    }

    public String getRecommanderemail() {
        return recommanderemail;
    }

    public void setRecommanderemail(String recommanderemail) {
        this.recommanderemail = recommanderemail;
    }

    public Integer getWithdrawsid() {
        return withdrawsid;
    }

    public void setWithdrawsid(Integer withdrawsid) {
        this.withdrawsid = withdrawsid;
    }
}

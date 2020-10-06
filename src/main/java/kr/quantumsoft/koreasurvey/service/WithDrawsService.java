package kr.quantumsoft.koreasurvey.service;

import kr.quantumsoft.koreasurvey.model.Withdraw;
import kr.quantumsoft.koreasurvey.repository.WithdrawRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WithDrawsService {
    @Autowired
    private WithdrawRepository repo;


    public boolean insert(Withdraw withdraw) {
        return repo.insert(withdraw) == 1;
    }

    public Withdraw getWithdrawById(Integer id) {
        return repo.selectById(id);
    }

    public void update(Withdraw item) {
        repo.update(item);
    }

}

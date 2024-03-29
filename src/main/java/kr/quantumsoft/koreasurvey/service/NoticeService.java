package kr.quantumsoft.koreasurvey.service;

import kr.quantumsoft.koreasurvey.model.Notice;
import kr.quantumsoft.koreasurvey.repository.NoticeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {
    @Autowired
    private NoticeRepository noticeRepository;

    public List<Notice> getNoticeTop3() {
        return noticeRepository.getNoticeList(2);
    }

    public List<Notice> getNotices(int size) {
        return noticeRepository.getNoticeList(size);
    }

    public List<Notice> getNoticeAll() {
        return noticeRepository.getNoticeAll();
    }

    public Notice getNoticeById(Integer id) {
        return noticeRepository.getNoticeById(id);
    }
    public void update(Notice notice) {
        noticeRepository.update(notice);
    }
}

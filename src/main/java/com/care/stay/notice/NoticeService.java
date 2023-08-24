package com.care.stay.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;

@Service
public class NoticeService {

    // 더미 데이터를 사용하여 공지사항 리스트 생성
    public List<Notice> getNoticeList() {
        List<Notice> noticeList = new ArrayList<>();
        
        // 여기에 실제 데이터베이스 쿼리를 사용하여 공지사항 데이터를 가져오는 로직을 추가할 수 있습니다.
        // 예시: noticeList = noticeDao.getNoticeList();
        
        // 더미 데이터 추가
        noticeList.add(new Notice("제목1", "내용1"));
        noticeList.add(new Notice("제목2", "내용2"));
        noticeList.add(new Notice("제목3", "내용3"));
        
        return noticeList;
    }

    public void noticeForm(String cp, Model model) {
        // 공지사항 리스트를 가져와 모델에 추가
        List<Notice> noticeList = getNoticeList();
        model.addAttribute("noticeList", noticeList);
    }

    // 더미 데이터를 사용할 공지사항 클래스
    public class Notice {
        private String ntitle;
        private String ncontent;

        public Notice(String title, String content) {
            this.ntitle = title;
            this.ncontent = content;
        }

        public String getTitle() {
            return ntitle;
        }

        public String getContent() {
            return ncontent;
        }
    }
}
package com.kh.swithme.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.swithme.board.model.service.BoardServiceImpl;
import com.kh.swithme.common.model.vo.PageInfo;
import com.kh.swithme.common.template.Pagination;

@Controller
public class BoardController {

	
	@Autowired
	private BoardServiceImpl boardService;
	
	/**
	 * 게시판 리스트 불러오기
	 * @param currentPage
	 * @param boardType 게시판 분류 (1. 자유게시판 / 2. 질문게시판)
	 * @param model
	 * @return 
	 */
	@RequestMapping("freeBoardListView.bo")
	public String boardListView(@RequestParam(value="cPage", defaultValue="1") int currentPage,
								int boardType, Model model) {
		
		if(boardType == 1) {
			PageInfo pi = Pagination.getPageInfo(boardService.boardListCount(boardType), currentPage, 20, 10);
			model.addAttribute("pi", pi);
			model.addAttribute("list", boardService.selectBoardList(boardType, pi));
			// System.out.println(boardService.selectBoardList(boardType, pi));
			return "board/freeBoardListView";
		}else {
			PageInfo pi = Pagination.getPageInfo(boardService.boardListCount(boardType), currentPage, 20, 10);
			model.addAttribute("pi", pi);
			model.addAttribute("list", boardService.selectBoardList(boardType, pi));
			return "board/infoBoardListView";
		}
	}
	
}

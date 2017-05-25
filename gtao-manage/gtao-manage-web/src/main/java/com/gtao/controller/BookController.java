package com.gtao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gtao.bean.EasyUIResult;
import com.gtao.pojo.Book;
import com.gtao.service.BookService;
@RequestMapping("book")
@Controller
public class BookController {

	@Autowired
	private BookService bookService;
	
	@RequestMapping(value="list",method=RequestMethod.GET)
	@ResponseBody
	public EasyUIResult queryBookList(@RequestParam(value="page",defaultValue="1")Integer page,@RequestParam(value="rows",defaultValue="5")Integer rows){
		return bookService.queryBookList(page, rows);
	}
	@RequestMapping(value="save",method=RequestMethod.POST)
	@ResponseBody
	public int saveBook(Book book){
		Boolean b;
		try{
		b = bookService.saveBook(book);
		}catch (Exception e) {
			// TODO: handle exception
			return 500;
		}
		if(b){
			return 201;
		}else{
			return 500;
		}
	}
	@RequestMapping(value="delete",method=RequestMethod.DELETE)
	@ResponseBody
	public int deleteBook(Long[] ids){
		if(ids==null){
			return 400;
		}
		Boolean b;
		try{
		b = bookService.deleteBookByIds(ids);
		}catch (Exception e) {
			// TODO: handle exception
			return 500;
		}
		if(b){
			return 204;
		}else{
			return 500;
		}
	}
}

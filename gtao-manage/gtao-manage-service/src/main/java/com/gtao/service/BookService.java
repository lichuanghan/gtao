package com.gtao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gtao.bean.EasyUIResult;
import com.gtao.mapper.BookMapper;
import com.gtao.pojo.Book;

@Service
public class BookService {
	
	@Autowired
	private BookMapper bookMapper;
	
	public EasyUIResult queryBookList(Integer page,Integer rows){
		PageHelper.startPage(page, rows);
		Example example = new Example(Book.class);
		example.setOrderByClause("id DESC");
		List<Book> bookList = bookMapper.selectByExample(example);
		PageInfo<Book> pageInfo = new PageInfo<Book>(bookList);
		return new EasyUIResult(pageInfo.getTotal(),pageInfo.getList());
	}
	
	public Boolean saveBook(Book book) {
        return this.bookMapper.insertSelective(book)==1;
    }
	public Boolean deleteBookById(Long id) {
        return this.bookMapper.deleteByPrimaryKey(id)==1;
    }

	public Boolean deleteBookByIds(Long[] ids) {
		Boolean b=false;
		int i=0;
		for(Long l:ids){
			int c = this.bookMapper.deleteByPrimaryKey(l);
			if(c!=1){
				i++;
			}
		}
		if(i==0)b=true;
		
		return b;
	}
}

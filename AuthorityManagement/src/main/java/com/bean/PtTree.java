package com.bean;

import java.util.List;

public class PtTree {
	private int id;
	private String name;
	private List<PtTree> children;
	private boolean hasChildren;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<PtTree> getChildren() {
		return children;
	}
	public void setChildren(List<PtTree> children) {
		this.children = children;
	}
	public boolean isHasChildren() {
		return hasChildren;
	}
	public void setHasChildren(boolean hasChildren) {
		this.hasChildren = hasChildren;
	}
	
}

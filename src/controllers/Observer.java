/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

/**
 *
 * @author otsaan
 */
public interface Observer {

    public void execute(Object view, Object dataObj ,String action );

}

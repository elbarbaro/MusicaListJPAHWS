/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.generation.musicalistjpahws.servicios.respuestas;

import com.generation.musicalistjpahws.models.Usuario;
import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import java.util.List;

/**
 *
 * @author leolopez94
 */
public class CustomExclusionStrategy implements ExclusionStrategy {

    @Override
    public boolean shouldSkipField(FieldAttributes fa) {
        return true;
    }

    @Override
    public boolean shouldSkipClass(Class<?> type) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

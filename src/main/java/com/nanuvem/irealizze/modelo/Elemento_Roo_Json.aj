// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nanuvem.irealizze.modelo;

import com.nanuvem.irealizze.modelo.Elemento;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Elemento_Roo_Json {
    
    public String Elemento.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Elemento Elemento.fromJsonToElemento(String json) {
        return new JSONDeserializer<Elemento>().use(null, Elemento.class).deserialize(json);
    }
    
    public static String Elemento.toJsonArray(Collection<Elemento> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Elemento> Elemento.fromJsonArrayToElementoes(String json) {
        return new JSONDeserializer<List<Elemento>>().use(null, ArrayList.class).use("values", Elemento.class).deserialize(json);
    }
    
}

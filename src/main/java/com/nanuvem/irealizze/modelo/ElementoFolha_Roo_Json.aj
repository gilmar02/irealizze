// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nanuvem.irealizze.modelo;

import com.nanuvem.irealizze.modelo.ElementoFolha;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect ElementoFolha_Roo_Json {
    
    public String ElementoFolha.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static ElementoFolha ElementoFolha.fromJsonToElementoFolha(String json) {
        return new JSONDeserializer<ElementoFolha>().use(null, ElementoFolha.class).deserialize(json);
    }
    
    public static String ElementoFolha.toJsonArray(Collection<ElementoFolha> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<ElementoFolha> ElementoFolha.fromJsonArrayToElementoFolhas(String json) {
        return new JSONDeserializer<List<ElementoFolha>>().use(null, ArrayList.class).use("values", ElementoFolha.class).deserialize(json);
    }
    
}

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.nanuvem.irealizze.modelo.perene;

import com.nanuvem.irealizze.modelo.perene.TabelaPreco;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect TabelaPreco_Roo_Json {
    
    public String TabelaPreco.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static TabelaPreco TabelaPreco.fromJsonToTabelaPreco(String json) {
        return new JSONDeserializer<TabelaPreco>().use(null, TabelaPreco.class).deserialize(json);
    }
    
    public static String TabelaPreco.toJsonArray(Collection<TabelaPreco> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<TabelaPreco> TabelaPreco.fromJsonArrayToTabelaPrecoes(String json) {
        return new JSONDeserializer<List<TabelaPreco>>().use(null, ArrayList.class).use("values", TabelaPreco.class).deserialize(json);
    }
    
}

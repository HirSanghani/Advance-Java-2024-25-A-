/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import javax.ejb.Stateless;

/**
 *
 * @author Admin
 */
@Stateless
public class CCBean {

   public void CCBean(){

}
   public double rupee_dollar(double a)
   {return a/83.96;
   }
   
    public double rupee_dinar(double a)
   {return a/247;
   }
     public double rupee_euro(double a)
   {return a/91.96;
   }
      
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techblog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author vamsh
 */
public class Helper {

    public static boolean deleteFile(String path) {

        boolean flag = false;

        File file = new File(path);
        flag = file.delete();

        try {

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;

    }

    public static boolean saveFile(InputStream is, String path) {
        boolean flag = false;

        try {

            byte b[] = new byte[is.available()];

            is.read(b);

            FileOutputStream fos = new FileOutputStream(path);

            fos.write(b);
            fos.flush();

            fos.close();

            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

}

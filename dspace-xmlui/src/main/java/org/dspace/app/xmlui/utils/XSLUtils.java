/**
 * The contents of this file are subject to the license and copyright
 * detailed in the LICENSE and NOTICE files at the root of the source
 * tree and available online at
 *
 * http://www.dspace.org/license/
 */
package org.dspace.app.xmlui.utils;

import org.jsoup.Jsoup;

/**
 * Utilities that are needed in XSL transformations.
 *
 * @author Art Lowel (art dot lowel at atmire dot com)
 */
public class XSLUtils {

    /*
     * Cuts off the string at the space nearest to the targetLength if there is one within
     * maxDeviation chars from the targetLength, or at the targetLength if no such space is
     * found
     */
    public static String shortenString(String string, int targetLength, int maxDeviation) {
        targetLength = Math.abs(targetLength);
        maxDeviation = Math.abs(maxDeviation);
        if (string == null || string.length() <= targetLength + maxDeviation)
        {
            return string;
        }


        int currentDeviation = 0;
        while (currentDeviation <= maxDeviation) {
            try {
                if (string.charAt(targetLength) == ' ')
                {
                    return string.substring(0, targetLength) + " ...";
                }
                if (string.charAt(targetLength + currentDeviation) == ' ')
                {
                    return string.substring(0, targetLength + currentDeviation) + " ...";
                }
                if (string.charAt(targetLength - currentDeviation) == ' ')
                {
                    return string.substring(0, targetLength - currentDeviation) + " ...";
                }
            } catch (Exception e) {
                //just in case
            }

            currentDeviation++;
        }

        return string.substring(0, targetLength) + " ...";

    }
    
    /*
     * Remove html tags from String
     */
    public static String htmlToText(String htmlString) {
    	return Jsoup.parse(htmlString).text();
    }
    
    /*
     * Remove html tags from String, and Cuts off the string at the space nearest to the targetLength if there is one within
     * maxDeviation chars from the targetLength, or at the targetLength if no such space is found
     */
    public static String htmlToShortString(String htmlString, int targetLength, int maxDeviation) {
    	if (-1 == targetLength && -1 == maxDeviation) {
    		return htmlToText(htmlString);
    	}
    	else {
    		return shortenString(htmlToText(htmlString), targetLength, maxDeviation);
    	}
    }
}

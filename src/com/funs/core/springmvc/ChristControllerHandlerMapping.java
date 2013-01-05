package com.funs.core.springmvc;

import org.springframework.util.ClassUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.mvc.support.AbstractControllerUrlHandlerMapping;


public class ChristControllerHandlerMapping extends AbstractControllerUrlHandlerMapping {
    
    /**
     * Common suffix at the end of controller implementation classes. Removed when generating the URL path.
     */
    private static final String CONTROLLER_SUFFIX = "";
    
    /**
     * 
     */
    private boolean caseSensitive = false;
    
    /**
     * 
     */
    private String pathPrefix;
    
    /**
     * 
     */
    private String basePackage;
    
    /**
     * Set whether to apply case sensitivity to the generated paths, e.g. turning the class name "BuyForm" into "buyForm".
     * <p>
     * Default is "false", using pure lower case paths, e.g. turning the class name "BuyForm" into "buyform".
     * 
     * @param caseSensitive 是否区分大小写
     */
    public void setCaseSensitive(boolean caseSensitive) {
        this.caseSensitive = caseSensitive;
    }
    
    /**
     * Specify a prefix to prepend to the path generated from the controller name.
     * <p>
     * Default is a plain slash ("/"). A path like "/mymodule" can be specified in order to have controller path mappings prefixed with that path,
     * e.g. "/mymodule/buyform" instead of "/buyform" for the class name "BuyForm".
     * 
     * @param prefixPath 前缀路径
     */
    public void setPathPrefix(String prefixPath) {
        this.pathPrefix = prefixPath;
        if (StringUtils.hasLength(this.pathPrefix)) {
            if (!this.pathPrefix.startsWith("/")) {
                this.pathPrefix = "/" + this.pathPrefix;
            }
            if (this.pathPrefix.endsWith("/")) {
                this.pathPrefix = this.pathPrefix.substring(0, this.pathPrefix.length() - 1);
            }
        }
    }
    
    /**
     * Set the base package to be used for generating path mappings, including all subpackages underneath this packages as path elements.
     * <p>
     * Default is <code>null</code>, using the short class name for the generated path, with the controller's package not represented in the path.
     * Specify a base package like "com.mycompany.myapp" to include subpackages within that base package as path elements, e.g. generating the path
     * "/mymodule/buyform" for the class name "com.mycompany.myapp.mymodule.BuyForm". Subpackage hierarchies are represented as individual path
     * elements, e.g. "/mymodule/mysubmodule/buyform" for the class name "com.mycompany.myapp.mymodule.mysubmodule.BuyForm".
     * 
     * @param basePackage 报名
     */
    public void setBasePackage(String basePackage) {
        this.basePackage = basePackage;
        if (StringUtils.hasLength(this.basePackage) && !this.basePackage.endsWith(".")) {
            this.basePackage = this.basePackage + ".";
        }
    }
    
    /**
     * @param beanName 实体名
     * @param beanClass 实体类
     * @return String[]
     */
    @SuppressWarnings("rawtypes")
	@Override
    protected String[] buildUrlsForHandler(String beanName, Class beanClass) {
        return generatePathMappings(beanClass);
    }
    
    /**
     * Generate the actual URL paths for the given controller class.
     * <p>
     * Subclasses may choose to customize the paths that are generated by overriding this method.
     * 
     * @param beanClass the controller bean class to generate a mapping for
     * @return the URL path mappings for the given controller
     */
    protected String[] generatePathMappings(Class<?> beanClass) {
        String strPackageName = beanClass.getPackage().getName();
        String strMoudleName = getMoudleName(strPackageName);
        StringBuilder sbPathMapping = buildPathPrefix(beanClass);
        String strClassName = ClassUtils.getShortName(beanClass);
        String strPath =
            strClassName.endsWith(CONTROLLER_SUFFIX) ? strClassName.substring(0, strClassName.lastIndexOf(CONTROLLER_SUFFIX)) : strClassName;
        
        sbPathMapping.append(strPath);
        if (isMultiActionControllerType(beanClass)) {
            return new String[] { strMoudleName + sbPathMapping.toString(), strMoudleName + sbPathMapping.toString() + "/*" };
        }
        return new String[] { sbPathMapping.toString() + "*" };
    }
    
    /**
     * 根据报名取模块名
     * 
     * @param packageName 包名
     * @return 模块名
     */
    private String getMoudleName(String packageName) {
        StringBuffer sbResult = new StringBuffer(256);
        if (packageName != null) {
            if (packageName.indexOf("com.comtop") != -1) {
                String[] strPackageNamesStrings = packageName.split("\\.");
                if (strPackageNamesStrings.length > 3) {
                    for (int i = 2; i < strPackageNamesStrings.length - 1; i++) {
                        sbResult.append("/").append(strPackageNamesStrings[i]);
                    }
                }
            } else {
                String[] strPackageNamesStrings = packageName.split("\\.");
                if (strPackageNamesStrings.length > 1) {
                    sbResult.append(strPackageNamesStrings[strPackageNamesStrings.length - 2]);
                }
            }
        }
        return sbResult.toString();
    }
    
    /**
     * Build a path prefix for the given controller bean class.
     * 
     * @param beanClass the controller bean class to generate a mapping for
     * @return the path prefix, potentially including subpackage names as path elements
     */
    private StringBuilder buildPathPrefix(Class<?> beanClass) {
        StringBuilder sbPathMapping = new StringBuilder();
        if (this.pathPrefix != null) {
            sbPathMapping.append(this.pathPrefix);
            sbPathMapping.append("/");
        } else {
            sbPathMapping.append("/");
        }
        if (this.basePackage != null) {
            String strPackageName = ClassUtils.getPackageName(beanClass);
            if (strPackageName.startsWith(this.basePackage)) {
                String strSubPackage = strPackageName.substring(this.basePackage.length()).replace('.', '/');
                sbPathMapping.append(this.caseSensitive ? strSubPackage : strSubPackage.toLowerCase());
                sbPathMapping.append("/");
            }
        }
        return sbPathMapping;
    }
}
// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.projectvolumemanagement.domain;

import com.projectvolumemanagement.domain.CheckProduck;
import com.projectvolumemanagement.domain.CheckProduckController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CheckProduckController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CheckProduckController.create(@Valid CheckProduck checkProduck, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, checkProduck);
            return "checkproducks/create";
        }
        uiModel.asMap().clear();
        checkProduck.persist();
        return "redirect:/checkproducks/" + encodeUrlPathSegment(checkProduck.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CheckProduckController.createForm(Model uiModel) {
        populateEditForm(uiModel, new CheckProduck());
        return "checkproducks/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CheckProduckController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("checkproduck", CheckProduck.findCheckProduck(id));
        uiModel.addAttribute("itemId", id);
        return "checkproducks/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CheckProduckController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("checkproducks", CheckProduck.findCheckProduckEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) CheckProduck.countCheckProducks() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("checkproducks", CheckProduck.findAllCheckProducks(sortFieldName, sortOrder));
        }
        return "checkproducks/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CheckProduckController.update(@Valid CheckProduck checkProduck, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, checkProduck);
            return "checkproducks/update";
        }
        uiModel.asMap().clear();
        checkProduck.merge();
        return "redirect:/checkproducks/" + encodeUrlPathSegment(checkProduck.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CheckProduckController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, CheckProduck.findCheckProduck(id));
        return "checkproducks/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CheckProduckController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        CheckProduck checkProduck = CheckProduck.findCheckProduck(id);
        checkProduck.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/checkproducks";
    }
    
    void CheckProduckController.populateEditForm(Model uiModel, CheckProduck checkProduck) {
        uiModel.addAttribute("checkProduck", checkProduck);
    }
    
    String CheckProduckController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}

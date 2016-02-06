//
//  InfoViewController.swift
//  Wao
//
//  Created by 华瑞金科 on 16/2/3.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    var titleArray = ["姓名", "手机", "验证码", "请选择省市", "详细地址"]
    
    @IBOutlet weak var sureBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var nameTextField: UITextField!
    var phoneTextField: UITextField!
    var PINTextField: UITextField!
    var addressTextField: UITextField!
    
    var cityString: String?
    var pickerView: UIPickerView!
    var maskView: UIView!
    var provinceIndex = 0
    var cityIndex = 0
    var provinceName = [String]()
    var selectedProvince = NSDictionary()
    var cityName = [String]()
    var markView: UIView!
    var province = ""
    var city = ""
    
    lazy var provinceArray: NSArray = {
        let path = NSBundle.mainBundle().pathForResource("Provineces", ofType: "plist")!
        return NSArray(contentsOfFile: path)!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for province in provinceArray {
            let dict = province as! NSDictionary
            provinceName.append(dict["ProvinceName"] as! String)
        }
        
        
        tableView.keyboardDismissMode = .OnDrag
        
        addPickerView()
        addView()
    }

    @IBAction func pushSuccessVC(sender: AnyObject) {
        let paymentSuccessVC = UIStoryboard(name: "SBZTMain", bundle: nil).instantiateViewControllerWithIdentifier("paysuccess") as! PaysuccessViewController
        navigationController?.pushViewController(paymentSuccessVC, animated: true)
        
        
        
    }
    func addView(){
        self.markView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.markView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(self.markView)
        let singRecognizer = UITapGestureRecognizer(target: self, action: "changeKeyBoard")
        self.markView.addGestureRecognizer(singRecognizer)
    }
    func changeKeyBoard(){
        self.markView.hidden = true
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
    func addPickerView() {
        maskView = UIView()
        view.addSubview(maskView)
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor.whiteColor()
        maskView.addSubview(pickerView)
        maskView.frame = CGRectMake(0, self.view.frame.height - 180, self.view.frame.width, 180)
        pickerView.frame = CGRectMake(0, 0, self.maskView.frame.width, self.maskView.frame.height)
        let button = UIButton(type: .System)
        button.frame = CGRectMake(self.view.frame.width - 80, 6, 80, 30)
        button.setTitle("确定", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonChangeCell", forControlEvents: UIControlEvents.TouchUpInside)
        maskView.addSubview(button)
        maskView.hidden = true
    }

    func showPickerView() {
        maskView.hidden = false
        refreashData()
    }
    func hidePickerView() {
        maskView.hidden = true
    }
    func buttonChangeCell() {
        hidePickerView()
        
        province = provinceName[provinceIndex]
        
        if cityName.count < cityIndex {
            cityIndex = 0
        }
        city = cityName[cityIndex]
        
        cityString = province + "   " + city
        tableView.reloadData()
    }

}

extension InfoViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    // 设置列数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // 设置行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0){
            return provinceName.count
        }
        if(component == 1){
            return cityName.count
        }
        return 0

    }
    // 设置每行具体内容（titleForRow 和 viewForRow 二者实现其一即可）
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0){
            return provinceName[row]
        } else {
            return cityName[row]
        }
        
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        refreashData()
    }
    
    func refreashData() {
        provinceIndex = pickerView!.selectedRowInComponent(0)
        cityIndex = pickerView.selectedRowInComponent(1)
        if provinceIndex == 0 {
            pickerView.selectRow(0, inComponent: 1, animated: false)
        }
        selectedProvince = provinceArray[provinceIndex] as! NSDictionary
        let cityArray = selectedProvince["cities"] as! NSArray
        var cityName = [String]()
        for city in cityArray {
            let cityDict = city as! NSDictionary
            cityName.append(cityDict["CityName"] as! String)
        }
        self.cityName = cityName
        pickerView?.reloadComponent(1)
    }
}


extension InfoViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("infocell") as! InfoCell
        cell.titleLabel.text = titleArray[indexPath.row]
        if indexPath.row != 2{
            cell.getCodeBtn.hidden = true
        } else {
            cell.getCodeBtn.hidden = false
        }
        if indexPath.row != 3{
            cell.provinceLab.hidden = true
        }
        
        if indexPath.row == 0 {
            nameTextField = cell.textField
        } else if indexPath.row == 1{
            phoneTextField = cell.textField
            phoneTextField.keyboardType = UIKeyboardType.NamePhonePad
            
        }else if indexPath.row == 2{
            PINTextField = cell.textField
            phoneTextField.keyboardType = UIKeyboardType.NumberPad
            
        }else if indexPath.row == 3{
            cell.textField.hidden = true
        }else{
            addressTextField = cell.textField
        }
        
        
        
        
        
        
        cell.provinceLab.text = cityString
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 3{
            showPickerView()
            nameTextField.resignFirstResponder()
            phoneTextField.resignFirstResponder()
            PINTextField.resignFirstResponder()
            addressTextField.resignFirstResponder()
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
}

extension InfoViewController: UITextFieldDelegate{
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneTextField{
            if range.location >= 11{
                return false
            }
            // 限制输入框只能输入阿拉伯数字及小数点
            let character = NSCharacterSet(charactersInString: "0123456789.").invertedSet
            let filter = string.componentsSeparatedByCharactersInSet(character) as NSArray
            let bTest = string.isEqual(filter.componentsJoinedByString("")).boolValue
            return bTest
        }
        if textField == PINTextField{
            if range.location >= 6{
                return false
            }
            // 限制输入框只能输入阿拉伯数字及小数点
            let character = NSCharacterSet(charactersInString: "0123456789.").invertedSet
            let filter = string.componentsSeparatedByCharactersInSet(character) as NSArray
            let bTest = string.isEqual(filter.componentsJoinedByString("")).boolValue
            return bTest
        }
        return true
    }
}
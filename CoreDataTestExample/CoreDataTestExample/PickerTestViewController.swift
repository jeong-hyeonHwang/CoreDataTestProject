//
//  PickerTestViewController.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/21.
//

import UIKit
import SnapKit

extension Int {
    
    func levelWithV() -> String {
        return "V\(self)"
    }
    
}

class PickerTestViewController: UIViewController {
    
    lazy var wheelPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "This is Level(Int) Appear Area"
        label.textAlignment = .center
        return label
    }()
    
    let levelMaximumValue: Int = 14
    
    override func viewDidLoad() {
        super.viewDidLoad()

        [
            wheelPicker,
            numberLabel
        ].forEach({
            view.addSubview($0)
        })
        
        layoutConfigure()
        
        let stringLevel = "VO" // <- utf 8bit + 8bit
        let intLevel = 0 // <- Int16(-32578 - E#333ee) : 16bit
        
        print("String Level \(stringLevel.utf8.count)")
    }
    
    func layoutConfigure() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        wheelPicker.snp.makeConstraints({
            
            $0.top.equalTo(safeArea.snp.top).inset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(350)
            $0.height.equalTo(300)
        })
        
        numberLabel.snp.makeConstraints({
            $0.top.equalTo(wheelPicker.snp.bottom).inset(-100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        })
    }
}

extension PickerTestViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // numberOfRowsInComponent: pickerView Rolling 상한값 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return levelMaximumValue
        
    }
    
    // didSelectRow: 특정 아이템 선택 시 numberLabel의 값을 변경
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberLabel.text = String(row)
    }
    
    // titleForRow: pickerView 각각의 행 title
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return row.levelWithV()
    }
    
    // pickerView에 담긴 아이템의 wheel의 수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}


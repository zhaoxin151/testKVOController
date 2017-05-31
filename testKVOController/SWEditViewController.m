//
//  SWEditViewController.m
//  testKVOController
//
//  Created by iMcG33k on 2017/5/30.
//  Copyright © 2017年 iMcG33k. All rights reserved.
//

#import "SWEditViewController.h"
#import "SWPerson.h"

@interface SWEditViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTF;

@end

@implementation SWEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameTF.text = self.person.nameStr;
    self.nameTF.delegate = self;
}



- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.person.nameStr = textField.text;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end

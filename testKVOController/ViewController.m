//
//  ViewController.m
//  testKVOController
//
//  Created by iMcG33k on 2017/5/30.
//  Copyright © 2017年 iMcG33k. All rights reserved.
//

#import "ViewController.h"
#import "SWPerson.h"
#import "KVOController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
/** model */
@property (nonatomic, strong) SWPerson *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _person = [[SWPerson alloc] init];
    self.person.nameStr = self.nameLab.text;
    
    __weak __typeof(&*self)ws = self;
    [self.KVOController observe:self.person keyPath:@"nameStr"
                        options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
                          block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
                              NSLog(@"%@ \n %@", change, [NSThread currentThread]);
                              __strong __typeof(&*ws)ss = ws;
                              ss.nameLab.text = [change objectForKey:@"new"];
                          }];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController *destination = segue.destinationViewController;
    if ([destination respondsToSelector:@selector(setPerson:)]) {
        [destination performSelector:@selector(setPerson:) withObject:self.person];
    }
    
}




@end

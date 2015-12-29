//
//  ViewController.m
//  SwitchView
//
//  Created by Sijia Davis on 11/12/15.
//  Copyright © 2015 SijiaDavis. All rights reserved.
//

#import "ViewController.h"
#import "PushViewController.h"
#import "ModalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openPushView:(id)sender
{
    NSLog(@"In PushView");
    PushViewController *pView = [[PushViewController alloc] initWithNibName:@"PushViewController" bundle:nil];
    pView.title=@"The Push View";
    [self.navigationController pushViewController:pView animated:YES];
    
}

- (IBAction)openModalView:(id)sender
{
    ModalViewController *mView = [[ModalViewController alloc] initWithNibName:@"ModalViewController" bundle:[NSBundle mainBundle]];
    mView.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    [self presentViewController:mView animated:YES completion:nil];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

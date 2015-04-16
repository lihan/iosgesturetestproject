//
//  ViewController.m
//  TestGuestureApp
//


#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) UIPanGestureRecognizer *gr;
@property (weak, nonatomic) IBOutlet UIView *transparentView;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://developer.apple.com/devcenter/ios/index.action"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    self.gr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePaning:)];
    self.gr.maximumNumberOfTouches = 2;
    self.gr.minimumNumberOfTouches = 2;
    self.gr.delegate = self;
    [self.view addGestureRecognizer:self.gr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handlePaning:(UIPanGestureRecognizer *)gr
{
    if (gr.state == UIGestureRecognizerStateBegan){
        NSLog(@"Panning Began");
        self.transparentView.alpha = 0.8f;
        self.transparentView.userInteractionEnabled = NO;

    }else if (gr.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Panning Ended");
        self.transparentView.alpha = 0.3f;
        self.transparentView.userInteractionEnabled = YES;
    }
}


@end

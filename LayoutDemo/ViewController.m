//
//  ViewController.m
//  HelloWorldDemo
//
//  Created by 黄洪彬 on 2018/11/9.
//  Copyright © 2018 黄洪彬. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

//一般控件写在扩展里面，而不是.h里面
@interface ViewController ()

@property (nonatomic, strong) UILabel       *shownText;

@property (nonatomic, strong) UITextField   *textfield;

@property (nonatomic, strong) UIButton      *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    //viewDidLoad：当程序第一次加载view时调用，以后都不会用到，一般用来设置大小和addSubView
    [super viewDidLoad];
    
    //注意，这里必须调用self.xx，这样才会调用getter方法，使用_xx不会调用getter方法
    [self.view addSubview:self.shownText];
    [self.view addSubview:self.textfield];
    [self.view addSubview:self.button];
    
    self.button.width = 100.f;
    self.button.height = 20.f;
}

- (void)viewDidLayoutSubviews {
    //viewDidLayoutSubviews：view已经布局完毕其subViews
    //一般用来控制控件的位置
    
    [super viewDidLayoutSubviews];
    
    //用写Frame的形式来布局
    [self layoutByFrame];
    
    //用Masonry的形式来布局
    //[self layoutByMasonry];
}

- (void)layoutByFrame {
    //让HelloWorld水平居中显示，竖直上距离中线50px
    self.shownText.centerX = self.view.centerX;
    self.shownText.centerY = self.view.centerY - 50.f;
    
    //让输入栏水平居中显示，并在HelloWorld的下方
    self.textfield.centerX = self.view.centerX;
    self.textfield.y = self.shownText.bottom + 20.f;
    
    //让按钮水平居中显示，并在输入栏的下方
    self.button.centerX = self.view.centerX;
    self.button.y = self.textfield.bottom + 20.f;
}

- (void)layoutByMasonry {
    [self.shownText mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-50.f);
    }];
    
    [self.textfield mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.shownText.mas_bottom).offset(20.f);
    }];
    
    [self.button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.textfield.mas_bottom).offset(20.f);
    }];
}

#pragma mark - buttonClick
- (void)buttonClick:(UIButton *)button {
    self.shownText.text = self.textfield.text;
    
    //showText内容发生改变，宽度需要重新适应
    [self.shownText sizeToFit];
}

#pragma mark - getter
- (UILabel *)shownText {
    //这是其中一种初始化方法，以后写代码使用这种模板类设置getter
    //记得加判断if (!_shownText)，因为每次调用self.shownText都会走这个方法
    //都是泪，我被上面的判断坑了一个小时。。
    if (!_shownText) {
        _shownText = ({
            UILabel *label = [[UILabel alloc] init];
            label.text = @"Hello World";                   //设置label内容
            label.font = [UIFont systemFontOfSize:16.f];   //字体大小为16
            [label sizeToFit];                             //设置字体大小之后让label具备长宽
            label;
        });
    }
    return _shownText;
}

- (UITextField *)textfield {
    if (!_textfield) {
        _textfield = ({
            UITextField *textfield = [[UITextField alloc] init];
            textfield.placeholder = @"Please input your name";
            textfield.font = [UIFont systemFontOfSize:16.f];
            [textfield sizeToFit];
            textfield;
        });
    }
    return _textfield;
}

- (UIButton *)button {
    if (!_button) {
        _button = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            [button setTitle:@"Done" forState:UIControlStateNormal];            //设置常态文字显示内容
            
            //注册点击事件
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button;
        });
    }
    return _button;
}

@end

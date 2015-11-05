//
//  ViewController.m
//  BirdGenius3
//
//  Created by The Ingolds on 10/2/15.
//  Copyright © 2015 Pencilskirt Studio. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray+Shuffle.h"
#import "Bird.h"

@interface ViewController ()


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.birdArray = [[NSMutableArray alloc]init];
    Bird *bird1 = [[Bird alloc] initWithImage:[UIImage imageNamed:@"1.png"] name:@"e" latinName:@"eagle" photogName:@"Franny Snaps"];
    [self.birdArray addObject:bird1];
    Bird *bird2 = [[Bird alloc] initWithImage:[UIImage imageNamed:@"2.png"] name:@"s" latinName:@"snake" photogName:@"Franny Snaps"];
    [self.birdArray addObject:bird2];
    Bird *bird3 = [[Bird alloc] initWithImage:[UIImage imageNamed:@"3.png"] name:@"a" latinName:@"apple" photogName:@"Franny Snaps"];
    [self.birdArray addObject:bird3];
    Bird *bird4 = [[Bird alloc] initWithImage:[UIImage imageNamed:@"4.png"] name:@"h" latinName:@"home" photogName:@"Franny Snaps"];
    [self.birdArray addObject:bird4];
    Bird *bird5 = [[Bird alloc] initWithImage:[UIImage imageNamed:@"5.png"] name:@"p" latinName:@"popsicle" photogName:@"Franny Snaps"];
    [self.birdArray addObject:bird5];
    Bird *bird6 = [[Bird alloc] initWithImage:[UIImage imageNamed:@"6.png"] name:@"u" latinName:@"umbrella" photogName:@"Franny Snaps"];
    [self.birdArray addObject:bird6];
    Bird *bird7 = [[Bird alloc] initWithImage:[UIImage imageNamed:@"7.png"] name:@"d" latinName:@"dog" photogName:@"Franny Snaps"];
    [self.birdArray addObject:bird7];
    Bird *bird8 = [[Bird alloc] initWithImage:[UIImage imageNamed:@"8.png"] name:@"u" latinName:@"unicorn" photogName:@"Franny Snaps"];
    [self.birdArray addObject:bird8];
    Bird *bird9 = [[Bird alloc] initWithImage:[UIImage imageNamed:@"9.png"] name:@"m" latinName:@"monkey" photogName:@"Franny Snaps"];
    [self.birdArray addObject:bird9];
    
    self.index = 0;
    
    self.birdArray = [self bjl_shuffledArray];
}


- (NSMutableArray *)bjl_shuffledArray
{
    NSMutableArray *shuffledArray = [self.birdArray mutableCopy];
    NSUInteger arrayCount = [shuffledArray count];
    
    for (NSUInteger i = arrayCount - 1; i > 0; i--) {
        NSUInteger n = arc4random_uniform(i + 1);
        [shuffledArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    return [shuffledArray copy];
}


- (IBAction)swipeCardLeft:(id)sender {

    self.index++;
    if (self.index > self.birdArray.count-1) {
        self.index = 0;
    }
  
    Bird *currentBird = [self.birdArray objectAtIndex:self.index];
  
    
    _nameLabel.text = currentBird.latinName;
    _hidden.text = currentBird.name;
    _hidden.hidden = YES;
    _birdImageView.image = currentBird.image;
}


- (IBAction)swipeCardRight:(id)sender {
    self.index--;
    if (self.index < 0) {
        self.index = self.birdArray.count-1;
    }
    
    Bird *currentBird = [self.birdArray objectAtIndex:self.index];
    
    
    _nameLabel.text = currentBird.latinName;
    _hidden.text = currentBird.name;
    _hidden.hidden = YES;
    _birdImageView.image = currentBird.image;
    
}


- (IBAction)tapImage:(id)sender {
    if (_hidden.hidden == NO) {
        _hidden.hidden = YES;
    }else {
        _hidden.hidden = NO;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)threeFingerTap:(id)sender {
    NSLog(@"three finger tap");
}

@end


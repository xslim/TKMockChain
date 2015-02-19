# TKMockChain
Execute blocks in chain for easy mocking timed stuff

# Examples

``` objc
    [TKMockChain sleepBetween:0.5 chain:
     ^{[vc nextStatusMessage:@"Initiating transaction"];},
     ^{[vc nextStatusMessage:@"Selected application: MC"];},
     ^{[vc nextStatusMessage:@"Waiting for PIN: "];},
     ^{[vc changeStatusMessage:@"Waiting for PIN: *"];},
     ^{[vc changeStatusMessage:@"Waiting for PIN: **"];},
     ^{[vc changeStatusMessage:@"Waiting for PIN: ***"];},
     ^{[vc changeStatusMessage:@"Waiting for PIN: ****"];},
     ^{
         [vc nextStatusMessage:@"Finishing transaction"];
         vc.state = ADYProgressViewControllerStateSuccess;
         [vc presentButtons:@[
                              [UIButton buttonWithTitle:@"Receipt" target:nil action:nil],
                              [UIButton buttonWithTitle:@"Continue" target:self action:@selector(dismissModal)]
                              ]];
     },
     nil];
```

Or with `beforeEach` and `afterEach`

``` objc
    // Mock the device changes
    [TKMockChain sleepBetween:1 beforeEach:^{
        NSLog(@"Will change status");
    } afterEach:^{
        NSLog(@"New status: %i", self.mockKVOStatus);
    } chain:^{
        self.mockKVOStatus = 0;
    }, ^{
        self.mockKVOStatus = 1;
    }, ^{
        self.mockKVOStatus = 2;
    }, ^{
        self.mockKVOStatus = 3;
    }, ^{
        self.mockKVOStatus = 4;
    },  ^{
        self.mockKVOStatus = 1;
    },  ^{
        self.mockKVOStatus = 2;
    }, nil];
```

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

#import "DSTViewController.h"
#import "DSTColorViewController.h"

typedef void(^DSTSeguePreparation)(UIStoryboardSegue *segue,id sender);

@interface DSTViewController ()
@property (copy, nonatomic) DSTSeguePreparation showRedScene;
@property (copy, nonatomic) DSTSeguePreparation showGreenScene;
@property (copy, nonatomic) DSTSeguePreparation showBlueScene;
@end

@implementation DSTViewController

- (DSTSeguePreparation)showRedScene {
    if (! _showRedScene) {
        _showRedScene = ^(UIStoryboardSegue *segue, id sender){
            DSTColorViewController *redController
                        = segue.destinationViewController;
            redController.displayColor = [UIColor redColor];
            redController.displayText = [sender titleLabel].text;
        };
    }
    return _showRedScene;
}
- (DSTSeguePreparation)showGreenScene {
    if (! _showGreenScene) {
        _showGreenScene = ^(UIStoryboardSegue *segue, id sender){
            DSTColorViewController *greenController
                        = segue.destinationViewController;
            greenController.displayColor = [UIColor greenColor];
            greenController.displayText = [sender titleLabel].text;
        };
    }
    return _showGreenScene;
}
- (DSTSeguePreparation)showBlueScene {
    if (! _showBlueScene) {
        _showBlueScene = ^(UIStoryboardSegue *segue, id sender){
            DSTColorViewController *blueController
            = segue.destinationViewController;
            blueController.displayColor = [UIColor blueColor];
            blueController.displayText = [sender titleLabel].text;
        };
    }
    return _showBlueScene;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender {
    DSTSeguePreparation preparation = [self valueForKey:segue.identifier];
    if (preparation) {
        preparation(segue, sender);
    }
}
@end

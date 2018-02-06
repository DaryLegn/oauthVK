//
//  FriendsViewController.m
//  
//
//  Created by Дарья Кравченко on 04.02.2018.
//

#import "FriendsViewController.h"

static NSString *baseVKURL = @"https://api.vk.com/method/";
static NSString *VKURL = @"friends.get";

@interface FriendsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath: indexPath];
    
    VKNetworkManager *manager = [VKNetworkManager new];
    [manager loadGETRequest:VKURL requestCompletion:^(id responseObject, NSError *error)  {
        
        NSDictionary *dict = [responseObject valueForKey:@"response"];
        
        NSMutableArray *lastNameArray = [dict valueForKey:@"last_name"];
        NSString *lastName = [lastNameArray objectAtIndex:indexPath.row];
        cell.lastNameLabel.text = [NSString stringWithFormat:@"%@",lastName];
        
        NSMutableArray *firstNameArray = [dict valueForKey:@"first_name"];
        NSString *firstName = [firstNameArray objectAtIndex:indexPath.row];
        cell.firstNameLabel.text = [NSString stringWithFormat:@"%@",firstName];
        
        NSMutableArray *array = [dict valueForKey:@"photo_50"];
        NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:array[indexPath.row]]];
        cell.photoImage.image =[UIImage imageWithData:data];
        
    }];
    
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 90;
    
}


@end

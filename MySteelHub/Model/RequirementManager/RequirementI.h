//
//  RequirementI.h
//  MySteelHub
//
//  Created by Amit Yadav on 10/07/16.
//  Copyright © 2016 MySteelHub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequirementI : NSObject

@property(strong,nonatomic) NSString *userID;
@property(assign,nonatomic) BOOL *isPhysical;
@property(assign,nonatomic) BOOL *isChemical;
@property(assign,nonatomic) BOOL *isTestCertificateRequired;
@property(strong,nonatomic) NSString *length;
@property(strong,nonatomic) NSString *type;
@property(strong,nonatomic) NSString *budget;
@property(strong,nonatomic) NSString *city;
@property(strong,nonatomic) NSString *state;
@property(strong,nonatomic) NSDate *requiredByDate;



@property(strong,nonatomic) NSMutableArray *arraySpecifications;
@property(strong,nonatomic) NSMutableArray *arrayGradesRequired;
@property(strong,nonatomic) NSMutableArray *arrayPreferedBrands;


@end
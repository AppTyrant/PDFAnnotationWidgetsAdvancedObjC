//
//  ViewController.m
//  PDFAnnotationWidgetsAdvancedObjC
//
//  Created by ANTHONY CRUZ on 10/5/23.
//  Copyright © 2023 App Tyrant Corp. All rights reserved.

#import "ViewController.h"
#import <PDFKit/PDFKit.h>

@interface ViewController ()

@property (nonatomic, weak) IBOutlet PDFView *pdfView;

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    // Load our simple PDF document, retrieve the first page
    NSURL *documentURL = [[NSBundle mainBundle] URLForResource:@"MyForm" withExtension:@"pdf"];
    PDFDocument *document = [[PDFDocument alloc] initWithURL:documentURL];
    PDFPage *page = [document pageAtIndex:0];

    // Set our document to the view, center it, and set a background color
    self.pdfView.document = document;
    self.pdfView.autoScales = true;
    self.pdfView.backgroundColor = [UIColor lightGrayColor];

    // Add Name: and Date: fields
    [self insertFormFieldsIntoPage:page];

    // Add Question 1 widgets: "Have you been to a music festival before?"
    [self insertRadioButtonsIntoPage:page];

    // Add Question 2 widgets: "Which of the following music festivals have you attended?"
    [self insertCheckBoxesIntoPage:page];

    // Question 3: "Give one recommendation to improve a music festival:"
    [self insertMultilineTextBoxIntoPage:page];

    // Reset Form
    [self insertResetButtonIntoPage:page];
}

-(void)insertFormFieldsIntoPage:(PDFPage*)page
{
    CGRect pageBounds = [page boundsForBox:kPDFDisplayBoxCropBox];

    // Intro: "Name:" & "Date:"
    CGRect textFieldNameBounds = CGRectMake(169, pageBounds.size.height - 102, 371, 23);
    PDFAnnotation *textFieldName = [[PDFAnnotation alloc] initWithBounds:textFieldNameBounds forType:PDFAnnotationSubtypeWidget withProperties:nil];
    textFieldName.widgetFieldType = PDFAnnotationWidgetSubtypeText;
    textFieldName.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.25];
    textFieldName.font = [UIFont systemFontOfSize:18];
    [page addAnnotation:textFieldName];

    CGRect textFieldDateBounds = CGRectMake(283, pageBounds.size.height - 135, 257, 22);
    PDFAnnotation *textFieldDate = [[PDFAnnotation alloc] initWithBounds:textFieldDateBounds forType:PDFAnnotationSubtypeWidget withProperties:nil];
    textFieldDate.widgetFieldType = PDFAnnotationWidgetSubtypeText;
    textFieldDate.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.25];
    textFieldDate.font = [UIFont systemFontOfSize:18];
    textFieldDate.maximumLength = 5;
    textFieldDate.comb = YES;
    [page addAnnotation:textFieldDate];
}

-(void)insertRadioButtonsIntoPage:(PDFPage*)page
{
    CGRect pageBounds = [page boundsForBox:kPDFDisplayBoxCropBox];

    // Yes button
    CGRect radioButtonYesBounds = CGRectMake(135, pageBounds.size.height - 249, 24, 24);
    PDFAnnotation *radioButtonYes = [[PDFAnnotation alloc] initWithBounds:radioButtonYesBounds forType:PDFAnnotationSubtypeWidget withProperties:nil];
    radioButtonYes.widgetFieldType = PDFAnnotationWidgetSubtypeButton;
    radioButtonYes.widgetControlType = kPDFWidgetRadioButtonControl;
    radioButtonYes.fieldName = @"Radio Button";
    radioButtonYes.buttonWidgetStateString = @"Yes";
    [page addAnnotation:radioButtonYes];

    // No button
    CGRect radioButtonNoBounds = CGRectMake(210, pageBounds.size.height - 249, 24, 24);
    PDFAnnotation *radioButtonNo = [[PDFAnnotation alloc] initWithBounds:radioButtonNoBounds forType:PDFAnnotationSubtypeWidget withProperties:nil];
    radioButtonNo.widgetFieldType = PDFAnnotationWidgetSubtypeButton;
    radioButtonNo.widgetControlType = kPDFWidgetRadioButtonControl;
    radioButtonNo.fieldName = @"Radio Button";
    radioButtonNo.buttonWidgetStateString = @"No";
    [page addAnnotation:radioButtonNo];
}

-(void)insertCheckBoxesIntoPage:(PDFPage*)page
{
    CGRect pageBounds = [page boundsForBox:kPDFDisplayBoxCropBox];

    CGRect checkboxLoremFestivalBounds = CGRectMake(255, pageBounds.size.height - 370, 24, 24);
    PDFAnnotation *checkboxLoremFestival = [[PDFAnnotation alloc] initWithBounds:checkboxLoremFestivalBounds forType:PDFAnnotationSubtypeWidget withProperties:nil];
    checkboxLoremFestival.widgetFieldType = PDFAnnotationWidgetSubtypeButton;
    checkboxLoremFestival.widgetControlType = kPDFWidgetCheckBoxControl;
    [page addAnnotation:checkboxLoremFestival];

    CGRect checkboxIpsumFestivalBounds = CGRectMake(255, pageBounds.size.height - 417, 24, 24);
    PDFAnnotation *checkboxIpsumFestival = [[PDFAnnotation alloc] initWithBounds:checkboxIpsumFestivalBounds forType:PDFAnnotationSubtypeWidget withProperties:nil];
    checkboxIpsumFestival.widgetFieldType = PDFAnnotationWidgetSubtypeButton;
    checkboxIpsumFestival.widgetControlType = kPDFWidgetCheckBoxControl;
    [page addAnnotation:checkboxIpsumFestival];

    CGRect checkboxDolorFestivalBounds = CGRectMake(255, pageBounds.size.height - 464, 24, 24);
    PDFAnnotation *checkboxDolorFestival = [[PDFAnnotation alloc] initWithBounds:checkboxDolorFestivalBounds forType:PDFAnnotationSubtypeWidget withProperties:nil];
    checkboxDolorFestival.widgetFieldType = PDFAnnotationWidgetSubtypeButton;
    checkboxDolorFestival.widgetControlType = kPDFWidgetCheckBoxControl;
    [page addAnnotation:checkboxDolorFestival];
}

-(void)insertMultilineTextBoxIntoPage:(PDFPage*)page
{
    CGRect pageBounds = [page boundsForBox:kPDFDisplayBoxCropBox];

    CGRect textFieldMultilineBounds = CGRectMake(90, pageBounds.size.height - 632, 276, 80);
    PDFAnnotation *textFieldMultiline = [[PDFAnnotation alloc] initWithBounds:textFieldMultilineBounds forType:PDFAnnotationSubtypeWidget withProperties:nil];
    textFieldMultiline.widgetFieldType = PDFAnnotationWidgetSubtypeText;
    textFieldMultiline.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.25];
    textFieldMultiline.font = [UIFont systemFontOfSize:24];
    textFieldMultiline.multiline = YES;
    [page addAnnotation:textFieldMultiline];
}

-(void)insertResetButtonIntoPage:(PDFPage*)page
{
    CGRect pageBounds = [page boundsForBox:kPDFDisplayBoxCropBox];

    CGRect resetButtonBounds = CGRectMake(90, pageBounds.size.height - 680, 106, 32);
    PDFAnnotation *resetButton = [[PDFAnnotation alloc] initWithBounds:resetButtonBounds forType:PDFAnnotationSubtypeWidget withProperties:nil];
    resetButton.widgetFieldType = PDFAnnotationWidgetSubtypeButton;
    resetButton.widgetControlType = kPDFWidgetPushButtonControl;
    resetButton.caption = @"Obliviate!";
    [page addAnnotation:resetButton];

    // Create PDFActionResetForm action to clear form fields.
    PDFActionResetForm *resetFormAction = [[PDFActionResetForm alloc] init];
    resetFormAction.fieldsIncludedAreCleared = NO;
    resetButton.action = resetFormAction;
}

@end

using {com.bugstory as bugstory} from '../db/schema';
using ProjectsService from '../srv/project-service';

annotate bugstory.Projects with @(UI : {

    Facets              : [
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#prjFGrp',
        Label  : '{i18n>projectDetails}'
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : 'sprints/@UI.LineItem',
        Label  : '{i18n>sprints}'
    },

    ],

    HeaderInfo          : {

        TypeName       : '{i18n>project}',
        TypeNamePlural : '{i18n>projects}',
        Title          : {
            $Type : 'UI.DataField',
            Value : projectName,
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : description,
        },
    },

    FieldGroup #prjFGrp : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {
            $Type : 'UI.DataField',
            Value : projectName,
        },
        {
            $Type : 'UI.DataField',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Value : plannedStartDate,
        },
        {
            $Type : 'UI.DataField',
            Value : plannedEndDate,
        },
        {
            $Type : 'UI.DataField',
            Value : actualStartDate,
        },
        {
            $Type : 'UI.DataField',
            Value : actualEndDate,
        },
        ],
    },

    Identification      : [{Value : projectName}],

    SelectionFields     : [
    projectName,
    description,
    ],

    LineItem            : [
    {Value : projectName},
    {Value : description},
    {Value : plannedStartDate},
    {Value : plannedEndDate},
    {Value : actualStartDate},
    {Value : actualEndDate}
    ]
});


annotate bugstory.Sprints with @(UI : {

    Facets               : [
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#sprtQual',
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Target : 'issues/@UI.LineItem',
        Label  : '{i18n>issues}',
    },

    {
        $Type  : 'UI.ReferenceFacet',
        Target : 'issues/@UI.Chart#Qualifier_ID_1',
        Label  : '{i18n>issuesChart}'

    }

    ],

    HeaderInfo           : {

        TypeName       : '{i18n>sprint}',
        TypeNamePlural : '{i18n>sprints}',
        Description    : {
            $Type : 'UI.DataField',
            Value : description,
        },
    },

    FieldGroup #sprtQual : {
        $Type : 'UI.FieldGroupType',
        Data  : [{
            $Type : 'UI.DataField',
            Value : description,
        }, ],
    },

    LineItem             : [
    {
        $Type : 'UI.DataField',
        Value : description,
    },
    {
        $Type : 'UI.DataField',
        Value : actualStartDate,
    },
    {
        $Type : 'UI.DataField',
        Value : actualEndDate,
    },
    {
        $Type : 'UI.DataField',
        Value : status,
    },
    ],
});


annotate bugstory.Issues with @(UI : {
    HeaderInfo                        : {

        TypeName       : '{i18n>issue}',
        TypeNamePlural : '{i18n>issues}',
        Description    : {
            $Type : 'UI.DataField',
            Value : description,
        },
    },

    Facets                            : [
    {
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#issuesQual',
        Label  : '{i18n>issueDetails}'
    },

    {
        $Type  : 'UI.ReferenceFacet',
        Target : 'comments/@UI.LineItem',
        Label  : '{i18n>comments}',
    }

    ],
    Identification                    : [
    {
        $Type  : 'UI.DataFieldForAction',
        Action : 'ProjectsService.EntityContainer/Issues_startIssue',
        Label  : '{i18n>startIssue}'
    },
    {
        $Type  : 'UI.DataFieldForAction',
        Action : 'ProjectsService.EntityContainer/Issues_closeIssue',
        Label  : '{i18n>closeIssue}'
    },
    {
        $Type  : 'UI.DataFieldForAction',
        Action : 'ProjectsService.EntityContainer/Issues_cancelIssue',
        Label  : '{i18n>cancelIssue}'
    },
    ],

    FieldGroup #issuesQual            : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {
            $Type : 'UI.DataField',
            Value : description,
        },
        {
            $Type : 'UI.DataField',
            Value : actualStartDate,
        },
        {
            $Type : 'UI.DataField',
            Value : actualEndDate,
        },
        {
            $Type : 'UI.DataField',
            Value : plannedStartDate,
        },
        {
            $Type : 'UI.DataField',
            Value : plannedEndDate,
        },
        {
            $Type : 'UI.DataField',
            Value : user_userID,
        }
        ],
    },

    LineItem                          : [
    {
        $Type  : 'UI.DataFieldForAction',
        Action : 'ProjectsService.EntityContainer/Issues_startIssue',
        Label  : '{i18n>startIssue}',

    },
    {
        $Type  : 'UI.DataFieldForAction',
        Action : 'ProjectsService.EntityContainer/Issues_closeIssue',
        Label  : '{i18n>closeIssue}'
    },
    {
        $Type  : 'UI.DataFieldForAction',
        Action : 'ProjectsService.EntityContainer/Issues_cancelIssue',
        Label  : '{i18n>cancelIssue}'
    },
    {
        $Type : 'UI.DataField',
        Value : description,
    },
    {
        $Type : 'UI.DataField',
        Value : actualStartDate,
    },
    {
        $Type : 'UI.DataField',
        Value : actualEndDate,
    },
    {
        $Type : 'UI.DataField',
        Value : plannedStartDate,
    },
    {
        $Type : 'UI.DataField',
        Value : plannedEndDate,
    },
    {
        $Type       : 'UI.DataField',
        Value       : issueStatu,
        Criticality : criticality
    },
    {
        $Type : 'UI.DataField',
        Value : user.UserName,
    }
    ],

    Identification #Qualifier_ID_1_ID : [

    ],

    Chart #Qualifier_ID_1             : {
        $Type               : 'UI.ChartDefinitionType',
        ChartType           : #Donut,
        Title               : 'Issue Status',
        MeasureAttributes   : [{
            $Type   : 'UI.ChartMeasureAttributeType',
            Measure : issueStatu,
            Role    : #Axis1
        }, ],

        DimensionAttributes : [{
            $Type     : 'UI.ChartDimensionAttributeType',
            Dimension : type_issueType,
            Role      : #Category
        }, ],

    },

});

annotate bugstory.Comments with @(UI : {

    Facets                       : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#CommentsFieldGrp',
        Label  : '{i18n>issueComments}'
    },

    ],

    FieldGroup #CommentsFieldGrp : {
        $Type : 'UI.FieldGroupType',
        Data  : [{
            $Type : 'UI.DataField',
            Value : comment,
        }],
    },

    LineItem                     : [
    {Value : createdBy},
    {Value : createdAt, },
    {Value : comment}
    ]
});


annotate bugstory.Users with @(UI : {

    Facets                     : [{
        $Type  : 'UI.ReferenceFacet',
        Target : '@UI.FieldGroup#userFieldGroup',
        Label  : '{i18n>userDetails}'
    }],

    FieldGroup #userFieldGroup : {
        $Type : 'UI.FieldGroupType',
        Data  : [
        {
            $Type : 'UI.DataField',
            Value : userID,
        },
        {
            $Type : 'UI.DataField',
            Value : UserName,
        }
        ],
    },

    SelectionFields            : [
    userID,
    UserName,
    ],

    LineItem                   : [
    {Value : userID},
    {Value : UserName}
    ]
});


annotate bugstory.Issues with {
    actualStartDate  @title : '{i18n>actualStartDate}';
    actualEndDate    @title : '{i18n>actualEndDate}';
    plannedStartDate @title : '{i18n>plannedStartDate}';
    plannedEndDate   @title : '{i18n>plannedEndDate}';
    issueStatu       @title : '{i18n>issueStatu}';
    description      @title : '{i18n>description}';
    description      @UI.MultiLineText;
    user             @title : '{i18n>userID}'
}

annotate bugstory.Sprints with {
    actualStartDate  @title : '{i18n>actualStartDate}';
    actualEndDate    @title : '{i18n>actualEndDate}';
    plannedStartDate @title : '{i18n>plannedStartDate}';
    plannedEndDate   @title : '{i18n>plannedEndDate}';
    status           @title : '{i18n>status}';
    description      @title : '{i18n>description}';
    description      @UI.MultiLineText;
};

annotate bugstory.Projects with {
    actualStartDate  @title : '{i18n>actualStartDate}';
    actualEndDate    @title : '{i18n>actualEndDate}';
    plannedStartDate @title : '{i18n>plannedStartDate}';
    plannedEndDate   @title : '{i18n>plannedEndDate}';
    projectName      @title : '{i18n>projectName}';
    description      @title : '{i18n>description}';
    description      @UI.MultiLineText;
};

annotate bugstory.Comments with {
    comment   @title : '{i18n>comment}';
    comment   @UI.MultilineText;
    createdAt @title : '{i18n>createdAt}';
    createdBy @title : '{i18n>createdBy}';
};

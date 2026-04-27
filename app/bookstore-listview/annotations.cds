using BookstoreService as service from '../../srv/service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Title',
                Value : Title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Genre',
                Value : Genre,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PublishedAt',
                Value : PublishedAt,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Page',
                Value : Page,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Price',
                Value : Price,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Entity Information',
            ID : 'EntityInformation',
            Target : '@UI.FieldGroup#EntityInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Chapters',
            ID : 'Chapters',
            Target : 'Chapters/@UI.LineItem#Chapters',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : Title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Genre',
            Value : Genre,
        },
        {
            $Type : 'UI.DataField',
            Label : 'PublishedAt',
            Value : PublishedAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Page',
            Value : Page,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price',
            Value : Price,
        },
    ],
    UI.FieldGroup #EntityInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
        ],
    },
);

annotate service.Books with {
    Author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Authors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : Author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name',
            },
        ],
    }
};

annotate service.Chapters with @(
    UI.LineItem #Chapters : [
        {
            $Type : 'UI.DataField',
            Value : Book.Chapters.Title,
            Label : 'Title',
        },
        {
            $Type : 'UI.DataField',
            Value : Book.Chapters.Pages,
            Label : 'Pages',
        },
        {
            $Type : 'UI.DataField',
            Value : Book.Chapters.Number,
            Label : 'Number',
        },
        {
            $Type : 'UI.DataField',
            Value : Book.Chapters.ID,
            Label : 'ID',
        },
    ]
);


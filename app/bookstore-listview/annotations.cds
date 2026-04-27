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
            {
                $Type : 'UI.DataField',
                Value : Status_code,
                Criticality : Status.criticality,
                CriticalityRepresentation : #WithIcon,
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
        {
            $Type : 'UI.DataField',
            Value : Status_code,
            Label : 'Status_code',
            Criticality : Status.criticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataField',
            Value : Stock,
            Label : 'Stock',
            Criticality : Status.criticality,
            CriticalityRepresentation : #WithIcon,
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
    UI.HeaderInfo : {
        TypeImageUrl : 'sap-icon://education',
        TypeName : 'Book',
        TypeNamePlural : 'Books',
    },
    UI.SelectionFields : [
        Price,
        Status_code,
    ],
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

annotate service.Books with {
    Price @Common.Label : 'Price'
};

annotate service.Books with {
    Status @(
        Common.Label : 'Status_code',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'BookStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : Status_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};


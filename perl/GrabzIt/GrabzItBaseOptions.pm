#!/usr/bin/perl 

package GrabzItBaseOptions;

sub new
{
    my $class = shift;       
    
    my $self = { };
    $self->{"customId"} = '';
    $self->{"country"} = '';
    $self->{"exportUrl"} = '';
    $self->{"delay"} = 0;

    bless $self, $class;

    return $self;
}

#
# The custom identifier that you are passing through to the web service
#
sub customId
{
    my $self = shift;   
    if (scalar(@_) == 1)
    {
        $self->{"customId"} = shift;
    }
    return $self->{"customId"};
}

#
# The country the capture should be created from: Default = "", Singapore = "SG", UK = "UK", US = "US"
#
sub country
{
    my $self = shift;   
    if (scalar(@_) == 1)
    {
        $self->{"country"} = shift;
    }
    return $self->{"country"};
}


#
# The country the capture should be created from: Default = "", UK = "UK", US = "US"
#
sub exportUrl
{
    my $self = shift;   
    if (scalar(@_) == 1)
    {
        $self->{"exportUrl"} = shift;
    }
    return $self->{"exportUrl"};
}

sub createParameters($$$$$)
{
    my ($self, $applicationKey, $sig, $callBackURL, $dataName, $dataValue) = @_;
    
    my %params = {}; 
    $params->{'key'} = $applicationKey;
    $params->{'country'} = $self->country();
    $params->{'export'} = $self->exportUrl();
    $params->{'customid'} = $self->customId();
    $params->{'callback'} = $callBackURL;
    $params->{'sig'} = $sig;
    $params->{$dataName} = $dataValue;
    
    return $params;
}
1;
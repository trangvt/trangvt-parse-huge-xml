<?php
function fomart_barcode($barcode_xml)
{
    $data = [];

    $data['x312'] = (string) $barcode_xml->x312;
    $data['x313'] = (string) $barcode_xml->x313;

    return $data;
}

/**
measure table
*/
function fomart_measure($measure_xml)
{
    $data = [];

    if (count($collection_xml) == 0) {
        return $data;
    }

    foreach ($measure_xml as $key => $value) {
        $data[$key]['x315'] = (string) $value->x315;
        $data[$key]['c094'] = (string) $value->c094;
        $data[$key]['c095'] = (string) $value->c095;
    }

    return $data;
}

/**
collection table
*/
function fomart_collection($collection_xml)
{
    $data = [];

    if (count($collection_xml) == 0) {
        return $data;
    }

    $collectionidentifier = $collection_xml[0]->collectionidentifier;
    $data['x344'] = (string) $collectionidentifier->x344;
    $data['b233'] = (string) $collectionidentifier->b233;
    $data['b244'] = (string) $collectionidentifier->b244;

    $collectionsequence = $collection_xml[0]->collectionsequence;
    $data['x479'] = (string) $collectionsequence->x479;
    $data['x480'] = (string) $collectionsequence->x480;
    $data['x481'] = (string) $collectionsequence->x481;

    $data['titledetail'] = (string) $collection_xml[0]->titledetail->titleelement->b203;

    return $data;
}

/**
contributor table
*/
function fomart_contributor($contributor_xml)
{
    $data = [];

    if (count($contributor_xml) == 0) {
        return $data;
    }

    foreach ($contributor_xml as $key => $value) {
        $data[$key]['b034'] = (string) $value->b034;
        $data[$key]['b035'] = (string) $value->b035;
        $data[$key]['b036'] = (string) $value->b036;
        $data[$key]['b037'] = (string) $value->b037;
        $data[$key]['b038'] = (string) $value->b038;
        $data[$key]['b039'] = (string) $value->b039;
        $data[$key]['b040'] = (string) $value->b040;
        $data[$key]['professionalaffiliation'] = (string) $value->professionalaffiliation->b046;
    }

    return $data;
}

/**
subject table
*/
function fomart_subject($subject_xml)
{
    $data = [];

    if (count($subject_xml) == 0) {
        return $data;
    }

    foreach ($subject_xml as $key => $value) {
        $data[$key]['b067'] = (string) $value->b067;
        $data[$key]['b068'] = (string) $value->b068;
        $data[$key]['b069'] = (string) $value->b069;
        $data[$key]['b070'] = (string) $value->b070;
        $data[$key]['b171'] = (string) $value->b171;
    }

    return $data;
}

function fomart_audience($audience_xml)
{
    $data = [];

    $data['b204'] = (string) $audience_xml->b204;
    $data['b206'] = (string) $audience_xml->b206;

    return $data;
}

function fomart_textcontent($textcontent_xml)
{
    $data = [];

    if (count($textcontent_xml) == 0) {
        return $data;
    }

    foreach ($textcontent_xml as $key => $value) {
        $data[$key]['x426'] = (string) $value->x426;
        $data[$key]['x427'] = (string) $value->x427;
        $data[$key]['d104'] = (string) $value->d104;
    }

    return $data;
}

function fomart_relatedmaterial($relatedmaterial_xml)
{
    $data = [];

    if (count($relatedmaterial_xml) == 0) {
        return $data;
    }

    foreach ($relatedmaterial_xml as $key => $value) {
        $data[$key]['x455'] = (string) $value->x455;
        $data[$key]['b012'] = (string) $value->b012;
        $data[$key]['b333'] = (string) $value->b333;
    }

    return $data;
}

function fomart_price($price_xml)
{
    $data = [];

    if (count($price_xml) == 0) {
        return $data;
    }

    foreach ($price_xml as $key => $value) {
        $data[$key]['j151'] = (string) $value->j151;
        $data[$key]['j152'] = (string) $value->j152;
        $data[$key]['discountcoded'] = fomart_discountcoded($value->discountcoded);
    }

    return $data;
}

function fomart_discountcoded($discountcoded_xml)
{
    $data = [];

    if (count($discountcoded_xml) == 0) {
        return $data;
    }

    foreach ($discountcoded_xml as $key => $value) {
        $data['j363'] = (string) $value->j363;
        $data['j378'] = (string) $value->j378;
        $data['j364'] = (string) $value->j364;
    }

    return $data;
}
# Read files in folder
$product = [];
$xml_file = 'products/9780471049234.xml';
$xml = simplexml_load_file($xml_file);

# Parse xml
$product['a001'] = (string) $xml->a001;
$product['a002'] = (string) $xml->a002;
$product['a194'] = (string) $xml->a194;
$product['x314'] = (string) $xml->descriptivedetail->x314;
$product['b012'] = (string) $xml->descriptivedetail->b012;
$product['b057'] = (string) $xml->descriptivedetail->b057;
$product['b058'] = (string) $xml->descriptivedetail->b058;
$product['b089'] = (string) $xml->publishingdetail->salesrights->b089;
$product['x450'] = (string) $xml->publishingdetail->salesrights->territory->x450;
$product['b061'] = (string) $xml->b061;

// $product['barcode'] = fomart_barcode($xml->barcode);

// // ------- descriptivedetail
// $measure_xml = $xml->xpath('/product/descriptivedetail/measure');
// // $product['measure'] = fomart_measure($measure_xml);

// $collection_xml = $xml->xpath('/product/descriptivedetail/collection');
// // $product['collection'] = fomart_collection($collection_xml);

// $product['titledetail'] = (string) $xml->descriptivedetail->titledetail->titleelement->b203;

// $contributor_xml = $xml->xpath('/product/descriptivedetail/contributor');
// // $product['contributor'] = fomart_contributor($contributor_xml);

// $product['b058'] = (string) $xml->descriptivedetail->b058;
// $product['language'] = (string) $xml->descriptivedetail->language->b252;

// $subject_xml = $xml->xpath('/product/descriptivedetail/subject');
// // $product['subject'] = fomart_subject($subject_xml);

// $product['audience'] = fomart_audience($xml->descriptivedetail->audience);
// // ------- descriptivedetail


// // ------- collateraldetail
// $textcontent_xml = $xml->xpath('/product/collateraldetail/textcontent');
// // $product['textcontent'] = fomart_textcontent($textcontent_xml);

// $product['supportingresource'] = (string) $xml->collateraldetail->supportingresource->resourceversion->x435;

// // $product['imprint'] = (string) $xml->publishingdetail->publishingdate->b306;
// // $product['publisher'] = (string) $xml->publishingdetail->publishingdate->b306;
// $product['publishingdate'] = (string) $xml->publishingdetail->publishingdate->b306;
// $product['copyrightstatement'] = (string) $xml->publishingdetail->copyrightstatement->b087;
// $product['salesrights'] = (string) $xml->publishingdetail->salesrights->territory->x450;

// $relatedmaterial_xml = $xml->xpath('/product/relatedmaterial/relatedproduct');;
// // $product['relatedmaterial'] = fomart_relatedmaterial($relatedmaterial_xml);

// $price_xml = $xml->xpath('/product/productsupply/supplydetail/price');;
// $product['price'] = fomart_price($price_xml);

// ------- collateraldetail
echo '<pre>';
var_dump($product);
echo '</pre>';
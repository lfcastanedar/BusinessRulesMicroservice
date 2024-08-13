// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

contract Report{
    
    address owner;
    string title;
    string module;
    string document_number;

    uint32 index = 0;

    struct detail_struct{
        string title;
        string module;
        string document_number;
    }

    struct paper_control{
        string id;
        string name;
        string hash;
        string hash_algorithm;
        uint32 order_document;
        uint32 start_page;
        uint32 end_page;
        string format;
        string origen;
        string created_by;
        uint created_on;
    }

    mapping (uint => paper_control) private list_of_paper_control;


    constructor(string memory _title, string memory _module, string memory _document_number){
        owner = msg.sender;

        title = _title;
        module = _module;
        document_number = _document_number;
    }

    function get_detail() public view returns(detail_struct memory){
        return detail_struct(title, module, document_number);
    }

    function set_document(
        string memory _id, 
        string memory _name, 
        string memory _hash, 
        string memory _hash_algorithm, 
        uint32 _number_pages, 
        string memory _format, 
        string memory _origen, 
        string memory _created_by, 
        uint _created_on
        ) public{

        uint32 start_page = 1;
        uint32 end_page = _number_pages;

        if(index > 0){
            start_page = list_of_paper_control[index - 1].end_page + 1;
            end_page = list_of_paper_control[index - 1].end_page + _number_pages;
        }

        list_of_paper_control[index] = paper_control(
            _id,
            _name,
            _hash,
            _hash_algorithm,
            (index + 1),
            start_page,
            end_page,
            _format,
            _origen,
            _created_by,
            _created_on
            );
        index++;
    }

    function get_documents() public view returns(paper_control[] memory){
        paper_control[] memory data = new paper_control[](index);

        for(uint i = 0; i < index; i++){
            paper_control storage item = list_of_paper_control[i];
            data[i] = item; 
        }
        return data;
    }

}
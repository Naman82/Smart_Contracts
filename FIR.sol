//SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract FIR{

    struct Complainant{
        string name;
        string fatherOrHusbandName;
        uint dob;
        string nationality;
        uint passportNo;
        uint passportDateOfIssue;
        string passportPlaceOfIssue;
        string occupation;
        string Address;
        uint phoneNo;
        uint aadharNo;
    }

    struct Suspected{
        string suspectedName;
        string suspectedAddress;
        uint suspectedContactNo;
        string suspectedRelation;
    }

    struct CaseIncharge{
        address CaseInchargeAddress;
        string nameOfCaseIncharge;
        uint contactNoOfCaseIncharge;
        string rankOfCaseIncharge;
    }
    
    struct firInfo{
        uint firNo;
        uint dateOfFir;
        string dayOfFir;
        string act;
        string section;
        bool isInformationWritten;
    }

    struct occurrenceInfo{
        string dayOfOffenceOccurrence;
        uint dateOfOffenceOccurrence;
        uint timeOfOffenceOccurrence;
        string placeOfOccurrence;
    }

    struct fir{
        firInfo firsInfo;
        occurrenceInfo occurrencesInfo;
        bool isCaseUnderThisPS;
        Complainant complainantInfo;
        Suspected suspectedInfo;
        string reasonForDelayInComplaint;
        string particularsOfProperty;
        uint valueOfProperty;
        CaseIncharge caseInchargeInfo;
    }

    fir[] public firss;

    function setValue(firInfo memory _firsInfo, occurrenceInfo memory _occurrencesInfo ,bool _isCaseUnderThisPS, Complainant memory _complainantInfo, Suspected memory _suspectedInfo, string memory _reasonForDelayInComplaint, string memory _particularsOfProperty, uint _valueOfProperty, CaseIncharge memory _caseInchargeInfo ) public {
        fir memory fir1 = fir({
            firsInfo: _firsInfo,
            occurrencesInfo: _occurrencesInfo,
            isCaseUnderThisPS: _isCaseUnderThisPS,
            complainantInfo: _complainantInfo,
            suspectedInfo: _suspectedInfo,
            reasonForDelayInComplaint: _reasonForDelayInComplaint,
            particularsOfProperty: _particularsOfProperty,
            valueOfProperty: _valueOfProperty,
            caseInchargeInfo: _caseInchargeInfo
        });

        firss.push(fir1);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

    contract organisation{
        struct Event{
            string name;
            address add;
            uint amount;
            uint date;
            uint ticket_count;
            uint ticket_rem;
        }
        
        mapping (uint=>Event) public events;
        mapping (address=>mapping (uint=>uint)) public ticket;
        uint public nextId;

        function create_Event (string memory _name,uint _amount,uint _date,uint _ticket_count) external 
        {
            require(_date>block.timestamp,"select future time");
            require(_ticket_count>0, "message");
            require(_amount>0, "amount should be greater than 0");
            events[nextId]=Event(_name,msg.sender,_amount,_date,_ticket_count,_ticket_count);
            nextId++;
        }

        function buy_ticket(uint Event_Id, uint Quantity) external payable
        {
            require(events[Event_Id].date!=0, "Event not exist");
            require(block.timestamp<events[Event_Id].date, "Event Already Done");
            require(events[Event_Id].ticket_rem>=Quantity, "All tickets are sold");
            require(Quantity>0, "Ticket Quantity must be greater then zero");
            require(msg.value==(Quantity*events[Event_Id].amount), "Not enough amount for tickets");
            events[Event_Id].ticket_rem-=Quantity;
            ticket[msg.sender][Event_Id]+=Quantity;

        }

        function transfer_Ticket(address _add, uint _quan,uint Event_Id) external
        { 
            require(events[Event_Id].date!=0, "Event not exist");
            require(block.timestamp<events[Event_Id].date, "Event Already Done");
            require(ticket[msg.sender][Event_Id]>=_quan, "You dont have enough ticket");
            ticket[_add][Event_Id]+=_quan;
            ticket[msg.sender][Event_Id]-=_quan; 
        }
    }

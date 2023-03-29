<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="apsnetexam.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CATEGORY" DataValueField="CATID">
    </asp:DropDownList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cnstringConnectionString %>" SelectCommand="SELECT * FROM [CATEGORY]"></asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ITEMCODE" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="735px">

       <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="ITEMCODE" HeaderText="ITEMCODE" ReadOnly="True" SortExpression="ITEMCODE" />
        <asp:BoundField DataField="ITEMNAME" HeaderText="ITEMNAME" SortExpression="ITEMNAME" />
        <asp:BoundField DataField="CATID" HeaderText="CATID" SortExpression="CATID" />
        <asp:BoundField DataField="EXPIREDATE" HeaderText="EXPIREDATE" SortExpression="EXPIREDATE" />
        <asp:CheckBoxField DataField="ACTIVE" HeaderText="ACTIVE"  />
        <asp:BoundField DataField="PICTURE" HeaderText="PICTURE"  />     
        <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "Images/"+ Eval("Picture") %>' CssClass="img-thumbnail" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
      
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:cnstringConnectionString %>" DeleteCommand="DELETE FROM [ITEMS] WHERE [ITEMCODE] = @original_ITEMCODE AND (([ITEMNAME] = @original_ITEMNAME) OR ([ITEMNAME] IS NULL AND @original_ITEMNAME IS NULL)) AND (([CATID] = @original_CATID) OR ([CATID] IS NULL AND @original_CATID IS NULL)) AND (([EXPIREDATE] = @original_EXPIREDATE) OR ([EXPIREDATE] IS NULL AND @original_EXPIREDATE IS NULL)) AND (([ACTIVE] = @original_ACTIVE) OR ([ACTIVE] IS NULL AND @original_ACTIVE IS NULL)) AND (([PICTURE] = @original_PICTURE) OR ([PICTURE] IS NULL AND @original_PICTURE IS NULL))" InsertCommand="INSERT INTO [ITEMS] ([ITEMCODE], [ITEMNAME], [CATID], [EXPIREDATE], [ACTIVE], [PICTURE]) VALUES (@ITEMCODE, @ITEMNAME, @CATID, @EXPIREDATE, @ACTIVE, @PICTURE)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ITEMS] WHERE ([CATID] = @CATID)" UpdateCommand="UPDATE [ITEMS] SET [ITEMNAME] = @ITEMNAME, [CATID] = @CATID, [EXPIREDATE] = @EXPIREDATE, [ACTIVE] = @ACTIVE, [PICTURE] = @PICTURE WHERE [ITEMCODE] = @original_ITEMCODE AND (([ITEMNAME] = @original_ITEMNAME) OR ([ITEMNAME] IS NULL AND @original_ITEMNAME IS NULL)) AND (([CATID] = @original_CATID) OR ([CATID] IS NULL AND @original_CATID IS NULL)) AND (([EXPIREDATE] = @original_EXPIREDATE) OR ([EXPIREDATE] IS NULL AND @original_EXPIREDATE IS NULL)) AND (([ACTIVE] = @original_ACTIVE) OR ([ACTIVE] IS NULL AND @original_ACTIVE IS NULL)) AND (([PICTURE] = @original_PICTURE) OR ([PICTURE] IS NULL AND @original_PICTURE IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ITEMCODE" Type="String" />
            <asp:Parameter Name="original_ITEMNAME" Type="String" />
            <asp:Parameter Name="original_CATID" Type="Int32" />
            <asp:Parameter Name="original_EXPIREDATE" Type="DateTime" />
            <asp:Parameter Name="original_ACTIVE" Type="Boolean" />
            <asp:Parameter Name="original_PICTURE" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ITEMCODE" Type="String" />
            <asp:Parameter Name="ITEMNAME" Type="String" />
            <asp:Parameter Name="CATID" Type="Int32" />
            <asp:Parameter Name="EXPIREDATE" Type="DateTime" />
            <asp:Parameter Name="ACTIVE" Type="Boolean" />
            <asp:Parameter Name="PICTURE" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="CATID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ITEMNAME" Type="String" />
            <asp:Parameter Name="CATID" Type="Int32" />
            <asp:Parameter Name="EXPIREDATE" Type="DateTime" />
            <asp:Parameter Name="ACTIVE" Type="Boolean" />
            <asp:Parameter Name="PICTURE" Type="String" />
            <asp:Parameter Name="original_ITEMCODE" Type="String" />
            <asp:Parameter Name="original_ITEMNAME" Type="String" />
            <asp:Parameter Name="original_CATID" Type="Int32" />
            <asp:Parameter Name="original_EXPIREDATE" Type="DateTime" />
            <asp:Parameter Name="original_ACTIVE" Type="Boolean" />
            <asp:Parameter Name="original_PICTURE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ITEMCODE" DataSourceID="SqlDataSource3" Height="49px" Width="386px" CellPadding="4" ForeColor="#333333" GridLines="None">
        <%--<AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <EditRowStyle BackColor="#2461BF" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />--%>
        <Fields>
            <asp:TemplateField HeaderText="ITEMCODE" SortExpression="ITEMCODE">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ITEMCODE") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ITEMCODE") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ITEMCODE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ITEMNAME" SortExpression="ITEMNAME">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("ITEMNAME") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ITEMNAME") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ITEMNAME") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CATID" SortExpression="CATID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CATID") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CATID") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CATID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="EXPIREDATE" SortExpression="EXPIREDATE">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("EXPIREDATE") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("EXPIREDATE") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("EXPIREDATE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ACTIVE" SortExpression="ACTIVE">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ACTIVE") %>' />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ACTIVE") %>' />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ACTIVE") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PICTURE" SortExpression="PICTURE">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox40" runat="server" Text='<%# Bind("PICTURE") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <%--<asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    <asp:Image ID="Image3" runat="server" />
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />--%>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PICTURE") %>'></asp:TextBox>
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    <asp:Image ID="Image3" runat="server" CssClass="img-thumbnail" />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Button" CausesValidation="False" OnClick="Button1_Click1" />

                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("PICTURE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            <asp:TemplateField HeaderText="Validations">
                <InsertItemTemplate>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                </InsertItemTemplate>
            </asp:TemplateField>
        </Fields>
       
        <EmptyDataTemplate>
            <asp:Button ID="InsertButton" runat="server" CommandName="New" Text="New" />
        </EmptyDataTemplate>


    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:cnstringConnectionString %>" DeleteCommand="DELETE FROM [ITEMS] WHERE [ITEMCODE] = @original_ITEMCODE AND (([ITEMNAME] = @original_ITEMNAME) OR ([ITEMNAME] IS NULL AND @original_ITEMNAME IS NULL)) AND (([CATID] = @original_CATID) OR ([CATID] IS NULL AND @original_CATID IS NULL)) AND (([EXPIREDATE] = @original_EXPIREDATE) OR ([EXPIREDATE] IS NULL AND @original_EXPIREDATE IS NULL)) AND (([ACTIVE] = @original_ACTIVE) OR ([ACTIVE] IS NULL AND @original_ACTIVE IS NULL)) AND (([PICTURE] = @original_PICTURE) OR ([PICTURE] IS NULL AND @original_PICTURE IS NULL))" InsertCommand="INSERT INTO [ITEMS] ([ITEMCODE], [ITEMNAME], [CATID], [EXPIREDATE], [ACTIVE], [PICTURE]) VALUES (@ITEMCODE, @ITEMNAME, @CATID, @EXPIREDATE, @ACTIVE, @PICTURE)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ITEMS] WHERE ([ITEMCODE] = @ITEMCODE)" UpdateCommand="UPDATE [ITEMS] SET [ITEMNAME] = @ITEMNAME, [CATID] = @CATID, [EXPIREDATE] = @EXPIREDATE, [ACTIVE] = @ACTIVE, [PICTURE] = @PICTURE WHERE [ITEMCODE] = @original_ITEMCODE AND (([ITEMNAME] = @original_ITEMNAME) OR ([ITEMNAME] IS NULL AND @original_ITEMNAME IS NULL)) AND (([CATID] = @original_CATID) OR ([CATID] IS NULL AND @original_CATID IS NULL)) AND (([EXPIREDATE] = @original_EXPIREDATE) OR ([EXPIREDATE] IS NULL AND @original_EXPIREDATE IS NULL)) AND (([ACTIVE] = @original_ACTIVE) OR ([ACTIVE] IS NULL AND @original_ACTIVE IS NULL)) AND (([PICTURE] = @original_PICTURE) OR ([PICTURE] IS NULL AND @original_PICTURE IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ITEMCODE" Type="String" />
            <asp:Parameter Name="original_ITEMNAME" Type="String" />
            <asp:Parameter Name="original_CATID" Type="Int32" />
            <asp:Parameter Name="original_EXPIREDATE" Type="DateTime" />
            <asp:Parameter Name="original_ACTIVE" Type="Boolean" />
            <asp:Parameter Name="original_PICTURE" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ITEMCODE" Type="String" />
            <asp:Parameter Name="ITEMNAME" Type="String" />
            <asp:Parameter Name="CATID" Type="Int32" />
            <asp:Parameter Name="EXPIREDATE" Type="DateTime" />
            <asp:Parameter Name="ACTIVE" Type="Boolean" />
            <asp:Parameter Name="PICTURE" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ITEMCODE" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ITEMNAME" Type="String" />
            <asp:Parameter Name="CATID" Type="Int32" />
            <asp:Parameter Name="EXPIREDATE" Type="DateTime" />
            <asp:Parameter Name="ACTIVE" Type="Boolean" />
            <asp:Parameter Name="PICTURE" Type="String" />
            <asp:Parameter Name="original_ITEMCODE" Type="String" />
            <asp:Parameter Name="original_ITEMNAME" Type="String" />
            <asp:Parameter Name="original_CATID" Type="Int32" />
            <asp:Parameter Name="original_EXPIREDATE" Type="DateTime" />
            <asp:Parameter Name="original_ACTIVE" Type="Boolean" />
            <asp:Parameter Name="original_PICTURE" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    </asp:Content>